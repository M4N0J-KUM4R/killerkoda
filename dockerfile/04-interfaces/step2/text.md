# Step 2: The Immortal Data (VOLUME)

The `VOLUME` instruction creates a "Mount Point".
If you don't provide a host folder, Docker creates an **Anonymous Volume** to save the data.

### Your Mission
1.  Create a Dockerfile that defines a volume at `/data`:
    ```dockerfile
    FROM alpine
    VOLUME /data
    CMD echo "I wrote this" > /data/file.txt && sleep infinity
    ```{{exec}}

2.  Build it:
    ```bash
    docker build -t app-vol .
    ```{{exec}}

3.  Run it and name it `data-maker`:
    ```bash
    docker run -d --name data-maker app-vol
    ```{{exec}}

4.  Wait a second, then **Delete** the container:
    ```bash
    sleep 2
    docker rm -f data-maker
    ```{{exec}}
    *Normally, data inside a container is gone when deleted. But `/data` was a VOLUME.*

5.  Find the orphaned volume:
    ```bash
    docker volume ls -q -f dangling=true
    ```{{exec}}
    *You should see a long hash ID. That's your data!*
