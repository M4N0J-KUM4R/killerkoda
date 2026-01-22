# Step 1: Drop your Privileges

We will create an image that starts as Root (to install things) and then switches to a standard user.

### Your Mission
1.  Create a secure Dockerfile:
    ```dockerfile
    FROM alpine
    # 1. Be Root to create the user
    RUN addgroup -S appgroup && adduser -S appuser -G appgroup
    
    # 2. Switch to the user
    USER appuser
    
    # 3. Prove it
    CMD whoami
    ```{{exec}}

2.  Build it:
    ```bash
    docker build -t app-secure .
    ```{{exec}}

3.  Run it:
    ```bash
    docker run --rm app-secure
    ```{{exec}}
    *Output should be "appuser", NOT "root".*

4.  Try to delete a system file (fails):
    ```bash
    docker run --rm app-secure rm /bin/sh
    ```{{exec}}
    *Permission denied. You are safe!*
