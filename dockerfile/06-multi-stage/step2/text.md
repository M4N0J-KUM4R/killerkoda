# Step 2: The Slim Image (Multi-Stage)

Now, let's do it right.
Stage 1: Build (Ubuntu + GCC)
Stage 2: Run (Alpine + Binary)

### Your Mission
1.  Update the `Dockerfile` to use stages:
    ```dockerfile
    # Stage 1: Builder
    FROM ubuntu AS builder
    RUN apt-get update && apt-get install -y gcc
    WORKDIR /app
    RUN echo 'int main() { return 0; }' > main.c
    RUN gcc -static main.c -o myapp

    # Stage 2: Runner
    FROM alpine
    WORKDIR /app
    COPY --from=builder /app/myapp .
    CMD ["./myapp"]
    ```{{exec}}
    *Note: We used `AS builder` to name the first stage, and `COPY --from=builder` to extract the file.*

2.  Build it:
    ```bash
    docker build -t slim-app .
    ```{{exec}}

3.  Compare sizes:
    ```bash
    docker images | grep -E "fat-app|slim-app"
    ```{{exec}}
    *The slim app is ~5MB (Base Alpine + Tiny binary). A 95% reduction!*
