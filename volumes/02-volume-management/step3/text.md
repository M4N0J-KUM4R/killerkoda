# Global Cleanup (Prune)

Unused volumes can eat up disk space. "Unused" means **NO container** (running or stopped) is using it.

### Your Mission

1.  **The blocking problem**:
    If `important-data` is attached to a **Stopped** container, safe cleanup WON'T touch it.
    Let's remove all stopped containers first:
    ```bash
    docker container prune -f
    ```{{exec}}

2.  **Prune Volumes**:
    Now that no containers exist to hold the volumes, we can delete them:
    ```bash
    docker volume prune -f
    ```{{exec}}
    *Watch it delete `important-data` and any anonymous hashes.*

3.  Check if `important-data` is gone:
    ```bash
    docker volume ls
    ```{{exec}}
    *It should be empty now.*
