# Step 6: IPvlan (High Performance)

**IPvlan** is similar to Macvlan, but lighter.
- **Macvlan**: Each container gets a unique MAC address. (Can hit switch port security limits).
- **IPvlan**: Containers share the Host's MAC address. (Good for high density).

### Your Mission

1.  Create an IPvlan network (L2 Mode):
    ```bash
    docker network create -d ipvlan \
      --subnet=192.168.20.0/24 \
      --gateway=192.168.20.1 \
      -o parent=eth0 \
      -o ipvlan_mode=l2 \
      my-ipvlan
    ```{{exec}}

2.  Run a container on it:
    ```bash
    docker run --rm --network my-ipvlan alpine ip addr
    ```{{exec}}
    *Notice the valid IP on the subnet, but it shares the underlying MAC mechanics.*

3.  **Cleanup**:
    ```bash
    docker network rm my-ipvlan
    ```{{exec}}
