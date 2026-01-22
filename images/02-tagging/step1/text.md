# Step 1: The Identity Crisis (Tagging)

A "Tag" is just a sticky note on an Image ID. You can have multiple sticky notes on the same image.

### Your Mission
1.  Pull the `alpine` image (if not already present):
    ```bash
    docker pull alpine
    ```{{exec}}

2.  Check its Image ID:
    ```bash
    docker images alpine
    ```{{exec}}
    *Note the IMAGE ID.*

3.  Create a NEW tag `my-alpine:v1` that points to the SAME image:
    ```bash
    docker tag alpine my-alpine:v1
    ```{{exec}}

4.  List images again:
    ```bash
    docker images
    ```{{exec}}
    *You should see `alpine` and `my-alpine` having the **SAME** Image ID. They are twins!*

5.  Now, delete the "Tag" (remove the sticky note):
    ```bash
    docker rmi my-alpine:v1
    ```{{exec}}
    *Did the image disappear? No! `Untagged: ...`. The original `alpine` is still there.*
