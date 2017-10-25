FROM ruby:2-alpine3.6 as sass
RUN set -x \
  && apk add --no-cache --virtual build-dep \
    build-base \
  && gem install sass --no-doc \
  && apk del build-dep \
  && rm -rf /var/cache/apk/*
COPY scss /usr/src/app
WORKDIR /usr/src/app
RUN sass bootstrap.scss > App.css

FROM node:8-alpine as dependencies
WORKDIR /usr/src/app
COPY package.json yarn.lock /usr/src/app/
RUN yarn install

FROM node:8-alpine as builder
WORKDIR /usr/src/app
COPY . .
COPY --from=dependencies /usr/src/app/node_modules /usr/src/app/node_modules
COPY --from=sass /usr/src/app/App.css /usr/src/app/src/App.css
RUN yarn build

FROM nginx:1.13-alpine
MAINTAINER SquareScale Engineering <engineering@squarescale.com>
LABEL maintainer "SquareScale Engineering <engineering@squarescale.com>"
LABEL name "Welcome to SquareScale"
LABEL version "0.1"

EXPOSE 80

COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /usr/src/app/build/ /usr/share/nginx/html
