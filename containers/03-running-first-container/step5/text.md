# Opening the Gates (Port Mapping)

Your web server is running, but it's locked inside the container network. You can't access it from the host!

We need to map a **Host Port** to the **Container Port**.

### Your Mission
1.  Kill any old version of our server:
    ```bash
    docker rm -f my-web-server || true
    ```{{exec}}

2.  Run it again, but map Host Port **8080** to Container Port **80**:
    ```bash
    docker run -d --name my-web-server -p 8080:80 nginx
    ```{{exec}}
    *Memory Aid: `-p HOST:CONTAINER` (Host is on the left, like your front door)*

3.  Check if it works:
    ```bash
    curl localhost:8080
    ```{{exec}}
    You should see the "Welcome to nginx!" HTML.
