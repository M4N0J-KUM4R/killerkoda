# Step 2: The Magic Way (ADD)

`ADD` is like `COPY`, but with a superpower: it **automatically extracts tarballs** (gzip, bzip2, etc.).

### Your Mission
1.  Create a tarball containing a secret message:
    ```bash
    echo "I was hidden inside a tarball" > secret.txt
    tar -czf secret.tar.gz secret.txt
    ```{{exec}}

2.  Update your `Dockerfile` to use `ADD` instead of `COPY`:
    ```dockerfile
    FROM alpine
    WORKDIR /app
    ADD secret.tar.gz .
    ```{{exec}}

3.  Build the image:
    ```bash
    docker build -t app-add .
    docker build -t app-add .
    ```{{exec}}

4.  Run it and check what happened:
    ```bash
    docker run --rm app-add ls -l /app
    ```{{exec}}
    *Wait! There is no `.tar.gz` file?*
    *Instead, you see `secret.txt` directly. Docker unpacked it for you!*

5.  Create a file `magic.txt` with the word "EXTRACTED" if you witnessed the magic.
    ```bash
    echo "EXTRACTED" > magic.txt
    ```{{exec}}
