# Step 1: The Recreation

We have a container running without a volume. We realize we need to save its data.

### Your Mission
1.  Run a container (Oops, forgot the volume!):
    ```bash
    docker run -d --name forgetful-app alpine sleep infinity
    ```{{exec}}

2.  **The Mistake**: Try to add a volume "on the fly".
    There is no `docker volume attach` command. You can't do it.

3.  **The Fix**:
    1.  Stop and remove the old container.
        ```bash
        docker rm -f forgetful-app
        ```{{exec}}
    2.  Run a **NEW** container with the same name and the volume attached.
        ```bash
        docker run -d --name forgetful-app -v my-data:/data alpine sleep infinity
        ```{{exec}}

4.  **One-off Copy**: What if you just want to copy files IN/OUT without restarting?
    Use `docker cp`.
    ```bash
    echo "I slipped in" > slip.txt
    docker cp slip.txt forgetful-app:/data/slip.txt
    ```{{exec}}

5.  Verify the file is inside:
    ```bash
    docker exec forgetful-app cat /data/slip.txt
    ```{{exec}}
    *Output: `I slipped in`*

6.  Create a file `lifecycle_rule.txt` saying "RECREATE" to confirm you understand containers must be recreated to change mounts.
    ```bash
    echo "RECREATE" > lifecycle_rule.txt
    ```{{exec}}
