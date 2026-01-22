# The Size Wars

Let's compare the file sizes of different base images.

### Your Mission
1.  Pull the different flavors of images:
    ```bash
    docker pull ubuntu:latest
    docker pull alpine:latest
    docker pull gcr.io/distroless/static-debian12
    ```{{exec}}

2.  Compare their sizes:
    ```bash
    docker images | grep -E "ubuntu|alpine|distroless"
    ```{{exec}}
    *Observed differences:*
    *   **Ubuntu**: ~70MB (Great for dev, heavy for prod)
    *   **Alpine**: ~3MB  (Tiny, uses `musl` instead of `glibc`)
    *   **Distroless**: ~2MB (Only contains the bare minimum to run an app)

3.  What about **Scratch**?
    `scratch` is special. It has **0 bytes**. It is empty. You can't pull it. You can only verify it exists in Docker's reserved words or use it in a `Dockerfile`.