# Step 2: The Walls of the Prison (Cgroups)

Namespaces hide things. **Cgroups** limit things (RAM, CPU).

We can tell Docker to limit a container's memory. If it eats too much, the Kernel will kill it (OOM Kill).

### Your Mission
1.  Run a container with only **10MB** of RAM:
    ```bash
    docker run -d --name weak-container --memory="10m" alpine sleep infinity
    ```

2.  Inspect the container to see the Cgroup configuration:
    ```bash
    docker inspect weak-container | grep Memory
    ```

3.  Now, let's look at the Cgroup file system on the **Host** (where the kernel keeps track):
    *We need the full container ID first.*
    ```bash
    ID=$(docker inspect -f '{{.Id}}' weak-container)
    cat /sys/fs/cgroup/memory/docker/$ID/memory.limit_in_bytes
    ```
    *Note: The path might be slightly different depending on cgroup version (v1 vs v2), but the concept remains.*

4.  Create a file `cgroup_limit.txt` containing the memory limit we set (10m).
    ```bash
    echo "10m" > cgroup_limit.txt
    ```

*(Bonus Interaction: If you ran a program using 20MB RAM inside that container, it would crash immediately! We won't crash it today, though.)*
