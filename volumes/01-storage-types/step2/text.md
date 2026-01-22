# Named Volumes (Managed)

**Named Volumes** are managed by Docker. They live in `/var/lib/docker/volumes/...`.
- **Pros**: Portable, safe, easy to backup.
- **Cons**: You can't easily "see" the files from your host shell without `docker volume folder`.

### Your Mission

1.  Run a container using a Named Volume:
    ```bash
    docker run -d --name type-named -v my-vol:/data alpine sleep infinity
    ```{{exec}}
    *`my-vol` does not look like a path, so Docker knows it is a Named Volume.*

2.  Create data inside it:
    ```bash
    docker exec type-named sh -c "echo 'Persist me' > /data/important.txt"
    ```{{exec}}

3.  Destroy the container:
    ```bash
    docker rm -f type-named
    ```{{exec}}
    *The container is gone.*

4.  Create a NEW container with the SAME volume:
    ```bash
    docker run -d --name type-named-2 -v my-vol:/app-data alpine sleep infinity
    ```{{exec}}

5.  Verify data survived:
    ```bash
    docker exec type-named-2 cat /app-data/important.txt
    ```{{exec}}
    *It survived!*
