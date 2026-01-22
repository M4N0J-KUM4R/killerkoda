# Step 2: The Permanent Variable (ENV)

`ENV` variables persist in the container. They are "Environment Variables".

### Your Mission
1.  Update your Dockerfile to use `ENV`:
    ```dockerfile
    FROM alpine
    ENV APP_MODE=production
    ```{{exec}}

2.  Build the image:
    ```bash
    docker build -t app-env .
    ```{{exec}}

3.  Run it and check the variable:
    ```bash
    docker run --rm app-env sh -c "echo I am in \$APP_MODE mode"
    ```{{exec}}
    *Output: "I am in production mode". It persisted!*

4.  You can even override it at runtime:
    ```bash
    docker run --rm -e APP_MODE=development app-env sh -c "echo I am in \$APP_MODE mode"
    ```{{exec}}
