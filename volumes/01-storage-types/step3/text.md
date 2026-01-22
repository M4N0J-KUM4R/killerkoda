# Tmpfs (RAM Disk)

**Tmpfs** mounts store data in the host's Memory (RAM).
- **Pros**: Extremely fast, secure (never touch disk).
- **Cons**: Data is lost when container stops.

### Your Mission

1.  Run a container with Tmpfs:
    ```bash
    docker run -d --name type-tmpfs --tmpfs /ramdisk alpine sleep infinity
    ```{{exec}}

2.  Write a secret file:
    ```bash
    docker exec type-tmpfs sh -c "echo 'I see you' > /ramdisk/ghost"
    ```{{exec}}

3.  Restart the container (Simulate a reboot/stop):
    ```bash
    docker restart type-tmpfs
    ```{{exec}}

4.  Check for the file:
    ```bash
    docker exec type-tmpfs ls /ramdisk
    ```{{exec}}
    *Output should be empty! The RAM was cleared.*
