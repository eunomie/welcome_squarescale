Welcome to SquareScale
======================

This project is a demo of a service to be run on [SquareScale](https://www.squarescale.com).

This is a react application with bootstrap css.

The service is built against Travis using a multistage Dockerfile:
- Bootstrap css is built with ruby and node tools
- The app is built with node tools
- The finish image is based on nginx

## Local run

1. Build the image

    ```
    docker build -t welcome_squarescale .
    ```

2. Run it

    ```
    docker run --rm -it -p 8080:80 welcome_squarescale
    ```

3. Browse [localhost:8080](http://localhost:8080)
