# Step 1: The Local Registry

First, we need a place to store our images. We'll start a simple registry server.

### Your Mission
1.  Review your current `alpine` image:
    ```bash
    docker images alpine
    ```{{exec}}

2.  Start a **Registry** container on port 5000:
    ```bash
    docker run -d -p 5000:5000 --name registry registry:2
    ```{{exec}}
    *This is an actual Docker Registry server running inside a container!*

3.  **Tag** your image for the proper destination.
    The rule is: `HOST:PORT/IMAGE_NAME:TAG`
    ```bash
    docker tag alpine localhost:5000/my-alpine
    ```{{exec}}

4.  Verify the tag exists:
    ```bash
    docker images
    ```{{exec}}
