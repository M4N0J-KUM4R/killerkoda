# Step 2: Overlay (Swarm Mode)

The `overlay` driver connects multiple Docker hosts together.
It requires **Swarm Mode**.

### Your Mission
1.  Initialize Swarm (Single Node):
    ```bash
    docker swarm init
    ```{{exec}}

2.  Create an Overlay Network:
    ```bash
    docker network create -d overlay my-mesh-net
    ```{{exec}}

3.  Deploy a service on it:
    ```bash
    docker service create --name mesh-app --network my-mesh-net --replicas 2 alpine sleep infinity
    ```{{exec}}

4.  Check the service:
    ```bash
    docker service ps mesh-app
    ```{{exec}}
    *In a real cluster, these replicas would be on different servers!*
