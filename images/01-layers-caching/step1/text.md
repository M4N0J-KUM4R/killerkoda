# Step 1: Inspecting Layers

We can see the history of an image to understand how it was built.

### Your Mission
1.  Run `docker history` on the Alpine image:
    ```bash
    docker history alpine
    ```{{exec}}
    *Notice the different lines? Each one is a layer created by a command.*

2.  Create a file `layers.txt` with the number of layers you count (it's usually small for Alpine, like 1 or 2). Just write "SEEN".
    ```bash
    echo "SEEN" > layers.txt
    ```{{exec}}
