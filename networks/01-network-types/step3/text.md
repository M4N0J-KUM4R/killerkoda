# Step 3: None (The Void)

**None** networking disables the network stack entirely.
- **Use Case**: High-security batch jobs that take input files, process them, and write output files, with ZERO risk of data leaking to the internet.

### Your Mission

1.  Run a container with no network:
    ```bash
    docker run --rm --network none alpine ip addr
    ```{{exec}}
    *You only see `lo` (Loopback). No `eth0`.*

2.  Try to escape:
    ```bash
    docker run --rm --network none alpine ping -c 1 8.8.8.8
    ```{{exec}}
    *Error: `Network is unreachable`.*
