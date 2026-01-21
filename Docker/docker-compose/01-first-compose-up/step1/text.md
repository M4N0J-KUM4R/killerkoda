# Step 1: Compose Up

We will define a simple stack with `nginx` and `redis`.

### Your Mission
1.  Create `docker-compose.yaml`:
    ```yaml
    version: '3'
    services:
      web:
        image: nginx
        ports:
          - "8080:80"
      db:
        image: redis
    ```
    *(You can use `vi docker-compose.yaml` to create this)*

2.  Start the entire stack in the background:
    ```bash
    docker-compose up -d
    ```

3.  Check if they are running:
    ```bash
    docker-compose ps
    ```
