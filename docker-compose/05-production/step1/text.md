# Step 1: Scale and Survive

We will create a robust, scalable web farm.

### Your Mission
1.  Create `docker-compose.yml` with limits and restart policies:
    ```bash
    cat <<EOF > docker-compose.yml
    version: '3.9'
    services:
      worker:
        image: alpine
        command: sleep infinity
        restart: always
        deploy:
          resources:
            limits:
              cpus: '0.1'
              memory: 50M
    EOF
    ```{{exec}}
    *Note: We limit it to 10% CPU and 50MB RAM. And it auto-restarts.*

2.  Run scaled up to 3 instances:
    ```bash
    docker compose up -d --scale worker=3
    ```{{exec}}

3.  Verify scaling:
    ```bash
    docker compose ps
    ```{{exec}}
    *You should see `worker-1`, `worker-2`, `worker-3`.*

4.  **Test Restart Policy**: Kill one instance locally.
    ```bash
    # Kill the first one (it sends SIGKILL)
    docker kill $(docker compose ps -q | head -n 1)
    ```{{exec}}

5.  Check status again:
    ```bash
    docker compose ps
    ```{{exec}}
    *It should say `Up ... (less than a second)` or similar. It came back to life!*
