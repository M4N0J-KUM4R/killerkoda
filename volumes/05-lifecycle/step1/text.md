# The Immutable Rule (Recreation)

We have a container running without a volume. We realize we need to save its data.
**Rule**: You CANNOT add a volume to a running container. You MUST recreate it.

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
        *The name `forgetful-app` is free again, so we reused it.*