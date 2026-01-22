# Create and Inspect

We will start by explicitly managing a volume.

### Your Mission
1.  **Create** a named volume explicitly:
    ```bash
    docker volume create important-data
    ```{{exec}}

2.  **List** all volumes:
    ```bash
    docker volume ls
    ```{{exec}}
    *You should see `important-data`.*

3.  **Inspect** to find where it lives on the host:
    ```bash
    docker volume inspect important-data
    ```{{exec}}
    *Look for `Mountpoint` (usually `/var/lib/docker/volumes/important-data/_data`).*
