# Step 1: FROM Scratch (almost)

Every Dockerfile starts with `FROM`.

### Your Mission
1.  Create a file named `Dockerfile`:
    ```bash
    echo "FROM alpine" > Dockerfile
    echo "RUN echo 'Building my first image...'" >> Dockerfile
    ```
2.  Build the image and tag it `my-first-image`:
    ```bash
    docker build -t my-first-image .
    ```
3.  Check if it exists:
    ```bash
    docker images | grep my-first-image
    ```
4.  Run it:
    ```bash
    docker run my-first-image echo "It works!"
    ```
