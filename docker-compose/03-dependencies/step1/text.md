# Step 1: Wait for it...

We will ensure the App waits for Redis to be fully ready.

### Your Mission
1.  Create `docker-compose.yml` with a Healthcheck:
    ```yaml
    version: '3.8'
    services:
      redis-db:
        image: redis
        healthcheck:
          test: ["CMD", "redis-cli", "ping"]
          interval: 5s
          timeout: 5s
          retries: 5
    
      my-web-app:
        image: alpine
        command: sh -c "echo 'Waiting for Redis...' && apk add --no-cache redis && redis-cli -h redis-db ping"
        depends_on:
          redis-db:
            condition: service_healthy
    ```
    (Generate it):
    ```bash
    cat <<EOF > docker-compose.yml
    version: '3.8'
    services:
      redis-db:
        image: redis
        healthcheck:
          test: ["CMD", "redis-cli", "ping"]
          interval: 5s
          timeout: 5s
          retries: 5
    
      my-web-app:
        image: alpine
        command: sh -c "echo 'App Starting...' && apk add --no-cache redis && redis-cli -h redis-db ping"
        depends_on:
          redis-db:
            condition: service_healthy
    EOF
    ```{{exec}}

2.  Run it:
    ```bash
    docker compose up
    ```{{exec}}
    *Observe the logs!*
    *You will see `redis-db` starting.*
    *`my-web-app` will NOT start immediately.*
    *It waits until Redis is healthy (PONG).*

3.  **Why this matters**:
    Without `condition: service_healthy`, both start at the same time. The app would try to ping Redis, fail, and crash.
    This pattern ensures **Zero Crash Loops** on deploy.
