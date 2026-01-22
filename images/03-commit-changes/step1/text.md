# Step 1: DIY Image (Commit)

Before Dockerfiles existed, people made images by hand. It's like taking a snapshot of a VM.

### Your Mission
1.  Run a base Ubuntu container:
    ```bash
    docker run -it --name builder ubuntu bash
    ```{{exec}}

2.  **Inside the container**, install something (e.g., `curl`):
    ```bash
    apt-get update && apt-get install -y curl
    ```{{exec}}
    *Now our container is different from the base image.*

3.  Exit the container:
    ```bash
    exit
    ```{{exec}}

4.  **Commit** your changes to create a new image:
    ```bash
    docker commit builder my-curl-image
    ```{{exec}}

5.  Run your new image and check if `curl` exists:
    ```bash
    docker run --rm my-curl-image curl --version
    ```{{exec}}
    *It works! usage: curl ...*
