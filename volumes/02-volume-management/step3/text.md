# Global Cleanup (Prune)

Unused volumes can eat up gigabytes of disk space. Let's clean them up.

### Your Mission
1.  **Prune** the mess (Delete all unused volumes):
    ```bash
    docker volume prune -f
    ```{{exec}}
    *Watch it delete the random hash volume.*
    *It will ALSO delete `important-data` because no container is currently using it!*

2.  Check if `important-data` is gone:
    ```bash
    docker volume ls
    ```{{exec}}
    *It's gone. `prune` is powerful.*
