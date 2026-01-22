# Step 2: Breaking In (Exec & Inspect)

The container `confused-app` is running, but it's not working right. We suspect a configuration issue.

### Your Mission
1.  **Inspect** the container to see its Environment Variables:
    ```bash
    docker inspect confused-app | grep Env -A 5
    ```{{exec}}
    *Do you see `DB_HOST=wronghost`? That looks suspicious.*

2.  **Exec** into the container to double-check from the inside:
    ```bash
    docker exec -it confused-app sh
    ```{{exec}}
    *(You are now inside the container)*

3.  Print the environment variable:
    ```sh
    echo $DB_HOST
    ```{{exec}}

4.  Exit the container:
    ```sh
    exit
    ```{{exec}}

5.  **Fix it!** Launch a new container named `happy-app` with the correct host:
    ```bash
    docker run -d --name happy-app -e DB_HOST=correcthost alpine sleep infinity
    ```{{exec}}

