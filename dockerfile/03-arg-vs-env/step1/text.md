# Step 1: The Ghost Variable (ARG)

`ARG` variables are available *only* while Docker is building the image.

### Your Mission
1.  Create a Dockerfile that uses an ARG:
    ```dockerfile
    FROM alpine
    ARG BUILD_VERSION
    RUN echo "Building version $BUILD_VERSION" > version.txt
    ```{{exec}}

2.  Build it, passing the argument:
    ```bash
    docker build -t app-arg --build-arg BUILD_VERSION=2.0 .
    ```{{exec}}

3.  Run the container and try to find the variable:
    ```bash
    docker run --rm app-arg sh -c "echo $BUILD_VERSION"
    ```{{exec}}
    *Output is empty! The variable is gone.*

4.  But check the file we created during build:
    ```bash
    docker run --rm app-arg cat version.txt
    ```{{exec}}
    *It says "Building version 2.0". The ARG was used *during* the build run command.*
