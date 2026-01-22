# Step 1: Profiles & Passwords

We will create a config that behaves differently based on how you run it.

### Your Mission
1.  Create a `.env` file with secrets:
    ```bash
    echo "DB_PASS=supersecret" > .env
    ```{{exec}}

2.  Create `docker-compose.yml`:
    ```bash
    cat <<EOF > docker-compose.yml
    version: '3.9'
    services:
      app:
        image: alpine
        command: sleep infinity
        environment:
          - PASSWORD=\${DB_PASS}
    
      debug-tool:
        image: alpine
        command: echo "I am a debug tool"
        profiles:
          - debug
    EOF
    ```{{exec}}
    *Note: `debug-tool` has a `debug` profile.*

3.  Run normally:
    ```bash
    docker compose up -d
    docker compose ps
    ```{{exec}}
    *Only `app` starts.*

4.  Verify `.env` interpolation:
    ```bash
    docker compose exec app env | grep PASSWORD
    ```{{exec}}
    *Output: `PASSWORD=supersecret`.*

5.  Run with **Profiles**:
    ```bash
    docker compose --profile debug up
    ```{{exec}}
    *Now `debug-tool` runs too!*
