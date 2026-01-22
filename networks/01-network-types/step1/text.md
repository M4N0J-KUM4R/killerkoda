# Step 1: The Bridge (Default)

The **Bridge** network is the default. It's like a private island inside your host.
Containers on the bridge get their own IP address (usually `172.17.x.x`) and can talk to each other if they know the IP.

### Your Mission

1.  Run a container and check its network:
    ```bash
    docker run --rm alpine ip addr show eth0
    ```{{exec}}
    *You should see `inet 172.17.0.x`. This is the Docker Bridge.*

2.  Run another one and see it gets a different IP:
    ```bash
    docker run --rm alpine ip addr show eth0
    ```{{exec}}
    *It increments!*
