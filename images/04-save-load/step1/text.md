# Exporting an Image

We need to send our `alpine` image to a secret off-grid server.

### Your Mission
1.  Verify you have the `alpine` image:
    ```bash
    docker images alpine
    ```{{exec}}

2.  **Save** it to a tar archive:
    ```bash
    docker save -o alpine-backup.tar alpine
    ```{{exec}}

3.  Verify the file verified exists:
    ```bash
    ls -lh alpine-backup.tar
    ```{{exec}}

4.  Now, simulatie moving to a new machine by **Deleting** the image from Docker:
    ```bash
    docker rmi alpine
    ```{{exec}}
    *If you have other tags for it, delete them too until it's gone.*

5.  Confirm it's gone:
    ```bash
    docker images alpine
    ```{{exec}}
    *Should be empty.*
