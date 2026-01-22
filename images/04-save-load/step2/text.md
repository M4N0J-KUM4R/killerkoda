# Importing the Image

We have arrived at the off-grid server with our tarball.

### Your Mission
1.  **Load** the image back into Docker:
    ```bash
    docker load -i alpine-backup.tar
    ```{{exec}}

2.  Verify it's back:
    ```bash
    docker images alpine
    ```{{exec}}
    *It's back! Same ID, same history.*
