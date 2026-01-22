# Global Cleanup (Prune)

Unused volumes can eat up disk space. "Unused" means **NO container** (running or stopped) is using it.

### Your Mission

1.  **The blocking problem**:
    If `important-data` is attached to a **Running** or **Stopped** container, safe cleanup WON'T touch it.
    Let's find and destroy any container holding our volume:
    ```bash
    for id in $(docker ps -aq --filter volume=important-data); do docker rm -f $id; done
    ```{{exec}}

2.  **Prune Volumes**:
    Now that the volume is definitely unused, we can delete it:
    ```bash
    docker volume prune -f
    ```{{exec}}
    *Watch it delete `important-data` and any anonymous hashes.*

3.  Check if `important-data` is gone:
    ```bash
    docker volume ls
    ```{{exec}}
    *It should be empty / gone now.*
