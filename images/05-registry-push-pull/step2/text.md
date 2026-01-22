# Push & Pull

Now let's upload our image and verify we can download it back.

### Your Mission
1.  **Push** the image to your local registry:
    ```bash
    docker push localhost:5000/my-alpine
    ```{{exec}}
    *You'll see it uploading layers (or "Mounted from..." if they already exist).*

2.  **Delete** the local image (both the tag and the original):
    ```bash
    docker rmi localhost:5000/my-alpine alpine:latest
    ```{{exec}}
    *Don't worry, it's safe in the registry!*

3.  Verify they are GONE from your local list:
    ```bash
    docker images
    ```{{exec}}

4.  **Pull** it back from the registry:
    ```bash
    docker pull localhost:5000/my-alpine
    ```{{exec}}

5.  Run it to prove it works:
    ```bash
    docker run --rm localhost:5000/my-alpine echo "I stayed in the cloud!"
    ```{{exec}}
