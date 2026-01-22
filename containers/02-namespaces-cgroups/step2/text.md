# Step 2: The Walls of the Prison (Cgroups)

Namespaces hide things. **Cgroups** limit things (RAM, CPU).

We can tell Docker to limit a container's memory. If it eats too much, the Kernel will kill it (OOM Kill).

### Your Mission
1.  Run a container with only **10MB** of RAM:
    ```bash
    docker run -d --name weak-container --memory="10m" alpine sleep infinity
    ```{{exec}}

2.  Inspect the container to see the Cgroup configuration:
    ```bash
    docker inspect weak-container | grep Memory
    ```{{exec}}

3.  Now, let's verify the limit using Docker's inspection tool (reliable across all systems):
    ```bash
    docker inspect weak-container | grep Memory
    ```{{exec}}
    *You should see `"Memory": 10485760` (which is 10MB).*

    *(Optional for Advanced Users: On some Linux systems, you can see this in `/sys/fs/cgroup/memory/docker/$ID/memory.limit_in_bytes` or `/sys/fs/cgroup/docker/$ID/memory.max`, but this varies heavily by OS version).*

4.  Create a file `cgroup_limit.txt` containing the memory limit we set (10m).
    ```bash
    echo "10m" > cgroup_limit.txt
    ```{{exec}}

*(Bonus Interaction: If you ran a program using 20MB RAM inside that container, it would crash immediately! We won't crash it today, though.)*
