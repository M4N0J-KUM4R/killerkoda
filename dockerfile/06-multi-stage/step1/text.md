# Step 1: The Fat Image

First, let's see the problem. We want to compile a C program. We need `gcc`.

### Your Mission
1.  Create a "Fat" Dockerfile:
    ```dockerfile
    FROM ubuntu
    RUN apt-get update && apt-get install -y gcc
    WORKDIR /app
    RUN echo 'int main() { return 0; }' > main.c
    RUN gcc main.c -o myapp
    CMD ["./myapp"]
    ```{{exec}}

2.  Build it:
    ```bash
    docker build -t fat-app .
    ```{{exec}}

3.  Check size:
    ```bash
    docker images fat-app
    ```{{exec}}
    *It's huge! (>100MB). Just for a tiny C binary?*
