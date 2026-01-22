# Step 1: Default vs Custom Bridge

Let's see why you should always create your own network.

### Your Mission
1.  **The Failure**: Run 2 containers on the default bridge.
    ```bash
    docker run -d --name legacy-1 alpine sleep infinity
    docker run -d --name legacy-2 alpine sleep infinity
    ```{{exec}}

2.  Try to ping `legacy-1` from `legacy-2` **by name**:
    ```bash
    docker exec legacy-2 ping -c 1 legacy-1
    ```{{exec}}
    *Error: bad address 'legacy-1'. The default bridge requires you to know IPs (which change).*

3.  **The Success**: Create a custom network.
    ```bash
    docker network create my-net
    ```{{exec}}

4.  Run 2 containers on this new network:
    ```bash
    docker run -d --name modern-1 --network my-net alpine sleep infinity
    docker run -d --name modern-2 --network my-net alpine sleep infinity
    ```{{exec}}

5.  Try to ping `modern-1` from `modern-2` **by name**:
    ```bash
    docker exec modern-2 ping -c 1 modern-1
    ```{{exec}}
    *Success! DNS Resolution is automatic on custom networks.*
