# Step 1: Volume Hygiene

We will create some mess (named and anonymous volumes) and then clean it up.

### Your Mission
1.  **Create** a named volume explicitly:
    ```bash
    docker volume create important-data
    ```{{exec}}

2.  **List** all volumes:
    ```bash
    docker volume ls
    ```{{exec}}
    *You should see `important-data` and maybe some random hashes from previous steps.*

3.  **Inspect** to find where it lives on the host:
    ```bash
    docker volume inspect important-data
    ```{{exec}}
    *Look for `Mountpoint` (usually `/var/lib/docker/volumes/...`).*

4.  **Create Mess**: Run a container that creates an anonymous volume, then delete the container.
    ```bash
    docker run --rm -v /data alpine date
    ```{{exec}}
    *The container is gone (`--rm`), but the Anonymous Volume it created IS STILL THERE!*

5.  **Prune** the mess (Delete all unused volumes):
    ```bash
    docker volume prune -f
    ```{{exec}}
    *Watch it delete the random hash volume. It might ALSO delete `important-data` if no container is using it!*

6.  Check if `important-data` is gone:
    ```bash
    docker volume ls
    ```{{exec}}
    *It's gone. `prune` is powerful.*
