# Step 1: The Standard Way (COPY)

`COPY` does exactly what you think: it copies files.

### Your Mission
1.  Create a standard text file:
    ```bash
    echo "Hello World" > hello.txt
    ```{{exec}}

2.  Create a `Dockerfile` that copies this file into `/app`:
    ```dockerfile
    FROM alpine
    WORKDIR /app
    COPY hello.txt .
    ```{{exec}}
    *Note: `WORKDIR` sets the destination folder, so `.` means `/app`.*

3.  Build the image:
    ```bash
    docker build -t app-copy .
    ```{{exec}}

4.  Run it and verify the file is there:
    ```bash
    docker run --rm app-copy cat /app/hello.txt
    ```{{exec}}
    *Output should be "Hello World".*
