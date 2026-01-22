# Step 3: Macvlan (Physical Identity)

The `macvlan` driver assigns a MAC address to the container, making it appear as a physical device on your network.
*Note: This is advanced and requires promiscuous mode on the host network.*

### Your Mission
1.  Create a Macvlan network attached to `eth0`:
    ```bash
    docker network create -d macvlan \
      --subnet=192.168.10.0/24 \
      --gateway=192.168.10.1 \
      -o parent=eth0 \
      my-macvlan
    ```{{exec}}
    *Note: We use a dummy subnet here to avoid breaking the lab's real network.*

2.  Run a container on it:
    ```bash
    docker run --rm --network my-macvlan alpine ip addr
    ```{{exec}}
    *It has its own MAC address and IP on the 192.168.10.x subnet.*

3.  **Cleanup**:
    Leaving Swarm and Macvlan networks around can mess up future labs.
    ```bash
    docker service rm mesh-app
    docker swarm leave --force
    docker network rm my-macvlan
    ```{{exec}}
