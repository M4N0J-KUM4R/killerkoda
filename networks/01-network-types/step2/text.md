# Step 2: Host Networking

**Host** networking removes the isolation. The container shares the **host's** network stack directly.
- **Pros**: Maximum performance (no NAT), simple for network tools.
- **Cons**: Port conflicts (can't have two apps on port 80), security risk.

### Your Mission

1.  Run a container on the Host network:
    ```bash
    docker run --rm --network host alpine ip addr
    ```{{exec}}
    *Whoa! You see EVERYTHING. You see `eth0` (the host's real IP), `lo` (localhost), and maybe other interfaces.*
    *The container sees exactly what the server sees.*
