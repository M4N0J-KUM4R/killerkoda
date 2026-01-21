# Step 1: The Silent Treatment (Logs)

The container `crashing-app` started and immediately died.
It's not in `docker ps`.

### Your Mission
1.  Find the container in the "graveyard" (stopped containers):
    ```bash
    docker ps -a
    ```
2.  Ask it what were its last words:
    ```bash
    docker logs crashing-app
    ```
3.  You should see a "CRITICAL ERROR" message.
4.  Create a file `cause_of_death.txt` with the text "DATABASE" (since the error was Database Connection Failed).
    ```bash
    echo "DATABASE" > cause_of_death.txt
    ```
