# Step 1: Build it Here

We will create a custom Python app and build it with Compose.

### Your Mission
1.  Create the App Code (`app.py`):
    ```bash
    echo 'print("Hello from the Built Container!")' > app.py
    ```{{exec}}

2.  Create the `Dockerfile`:
    ```bash
    cat <<EOF > Dockerfile
    FROM python:alpine
    COPY app.py .
    CMD ["python", "app.py"]
    EOF
    ```{{exec}}

3.  Create `docker-compose.yml` with a **Build Context**:
    ```bash
    cat <<EOF > docker-compose.yml
    version: '3.8'
    services:
      my-app:
        build:
          context: .
          dockerfile: Dockerfile
    EOF
    ```{{exec}}
    *Instead of `image: python`, we use `build: .`*

4.  **Build and Run**:
    ```bash
    docker compose up --build
    ```{{exec}}
    *Watch the build logs! Then it runs and prints "Hello...".*

5.  Make a change to the code:
    ```bash
    echo 'print("Version 2 is here!")' > app.py
    ```{{exec}}

6.  **Rebuild**:
    ```bash
    docker compose up --build
    ```{{exec}}
    *If you didn't use `--build`, it would run the OLD image!*
