# The Locked File

We will mount a file as read-only and try to destroy it.

### Your Mission
1.  Create a "Critical System Config":
    ```bash
    echo "password=1234" > config.ini
    ```{{exec}}

2.  Run a container with `:ro` permission:
    ```bash
    docker run -d --name viewer -v $(pwd)/config.ini:/app/config.ini:ro alpine sleep infinity
    ```{{exec}}

3.  Prove you can read it:
    ```bash
    docker exec viewer cat /app/config.ini
    ```{{exec}}
    *Output: `password=1234`*

4.  **Hack Attempt**: Try to overwrite it:
    ```bash
    docker exec viewer sh -c "echo 'hacked' > /app/config.ini"
    ```{{exec}}
    *Error: `Read-only file system`.*