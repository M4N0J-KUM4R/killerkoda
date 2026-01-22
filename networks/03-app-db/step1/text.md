# Step 1: Connecting Services

We will connect a Python (simulated) web app to a Redis cache.

### Your Mission
1.  Create a network called `backend`:
    ```bash
    docker network create backend
    ```{{exec}}

2.  Start the Database (Redis) and name it `redis-db`:
    ```bash
    docker run -d --name redis-db --network backend redis
    ```{{exec}}

3.  Start the Web App (Alpine with Curl) and try to connect:
    ```bash
    docker run --rm --network backend alpine \
      sh -c "apk add --no-cache redis && redis-cli -h redis-db ping"
    ```{{exec}}
    *Output: `PONG`*
    *It works! The web app found `redis-db` automatically.*

4.  **Best Practice**: Never hardcode IPs. Always use Environment Variables for hostnames.
    ```bash
    # Simulating an app that reads DB_HOST from env
    docker run -d --name web-app --network backend \
      -e DB_HOST=redis-db \
      alpine sleep infinity
    ```{{exec}}

5.  Verify connection from inside `web-app`:
    ```bash
    docker exec web-app ping -c 1 redis-db
    ```{{exec}}
