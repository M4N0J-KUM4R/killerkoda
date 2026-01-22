# Step 1: The Silent Treatment (Logs)

The container `crashing-app` started and immediately died.
It's not in `docker ps`.

### Your Mission
1.  Find the container in the "graveyard" (stopped containers):
    ```bash
    docker ps -a
    ```{{exec}}
2.  Ask it what were its last words:
    ```bash
    docker logs crashing-app
    ```{{exec}}
3.  You should see a "CRITICAL ERROR: Missing DB_HOST" message.

4.  **Fix it!** Run a new container named `fixed-app` with the missing variable:
    ```bash
    docker run -d --name fixed-app -e DB_HOST=localhost alpine sleep infinity
    ```{{exec}}
    *Now it should work (or at least stay running).*

