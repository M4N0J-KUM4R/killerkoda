# Step 1: Planting the Trigger

We will create a "Parent" image that forces any "Child" image to copy a file.

### Your Mission
1.  Create the **Parent** Dockerfile:
    ```dockerfile
    FROM alpine
    ONBUILD COPY website.html /app/index.html
    CMD cat /app/index.html
    ```{{exec}}
    *Note: We don't have `website.html` yet. That's fine! `ONBUILD` runs later.*

2.  Build the Parent:
    ```bash
    docker build -t my-parent .
    ```{{exec}}
    *Build succeeds instantly.*

3.  Now, assume the role of the Developer using this image.
    Create a `website.html` file:
    ```bash
    echo "<h1>I am the Child</h1>" > website.html
    ```{{exec}}

4.  Create the **Child** Dockerfile:
    ```dockerfile
    FROM my-parent
    # No other instructions needed!
    ```{{exec}}

5.  Build the Child:
    ```bash
    docker build -t my-child .
    ```{{exec}}
    *Look at the logs! You will see `Copying website.html` happening automatically.*

6.  Run the child:
    ```bash
    docker run --rm my-child
    ```{{exec}}
    *Output: `<h1>I am the Child</h1>`*
