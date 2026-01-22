# Step 1: The Lying Port (EXPOSE)

`EXPOSE 80` in a Dockerfile is like a "Caution: Wet Floor" sign. It doesn't actually mop the floor. You still need to map the ports.

### Your Mission
1.  Create a Dockerfile that exposes port 80:
    ```dockerfile
    FROM nginx
    EXPOSE 80
    ```{{exec}}
    *Note: Nginx listens on 80 by default anyway, but let's be explicit.*

2.  Build it:
    ```bash
    docker build -t app-expose .
    ```{{exec}}

3.  Run it **without** `-p`:
    ```bash
    docker run -d --name silent-server app-expose
    ```{{exec}}

4.  Try to reach it:
    ```bash
    curl localhost:80
    ```{{exec}}
    *Connection refused!* The container has the port open, but the HOST does not mapped it.

5.  Run it **with** `-p`:
    ```bash
    docker run -d -p 8080:80 --name loud-server app-expose
    ```{{exec}}

6.  Try again:
    ```bash
    curl localhost:8080
    ```{{exec}}
    *Success!*
