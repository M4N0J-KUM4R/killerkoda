# The Anonymous Trap

What happens when we create a volume implicitly and then destroy the container?

### Your Mission
1.  **Create Mess**: Run a container that creates an anonymous volume.
    ```bash
    docker run -d --name messy-app -v /data alpine sleep infinity
    ```{{exec}}

2.  **Destroy it**: Delete the container (but NOT the volume).
    ```bash
    docker rm -f messy-app
    ```{{exec}}
    *Note: We did NOT use `--rm` or `docker rm -v`. We just removed the container.*

3.  **List** volumes again:
    ```bash
    docker volume ls
    ```{{exec}}
    *You should see `important-data` AND a randomized hash (e.g., `4d6s8...`).*
    *The Anonymous Volume created by the container **persists** even after the container is deleted. This is "Dangling".*
