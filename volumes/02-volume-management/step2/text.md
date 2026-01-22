# The Anonymous Trap

What happens when we create a volume implicitly and then destroy the container?

### Your Mission
1.  **Create Mess**: Run a container that creates an anonymous volume, then delete the container immediately using `--rm`.
    ```bash
    docker run --rm -v /data alpine date
    ```{{exec}}
    *The container is gone (`--rm`). But what about the data?*

2.  **List** volumes again:
    ```bash
    docker volume ls
    ```{{exec}}
    *You should see `important-data` AND a randomized hash (e.g., `4d6s8...`).*
    *The Anonymous Volume created by the container **persists** even after the container is deleted.*
