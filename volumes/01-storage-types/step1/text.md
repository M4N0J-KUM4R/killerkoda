# Bind Mounts (Host Mapping)

**Bind Mounts** map a file or directory from your **Host** machine into the **Container**.
- **Pros**: Great for development (edit code on host, see in container).
- **Cons**: Dependent on the host's filesystem structure.

### Your Mission

1.  Create a file on the host:
    ```bash
    echo "I am from Host" > hostfile.txt
    ```{{exec}}

2.  Run a container using a Bind Mount:
    ```bash
    docker run -d --name type-bind -v $(pwd):/bind alpine sleep infinity
    ```{{exec}}
    *`-v $(pwd):/bind` means "Map my current folder to /bind inside".*

3.  Verify the file exists inside:
    ```bash
    docker exec type-bind cat /bind/hostfile.txt
    ```{{exec}}
    *Output should be "I am from Host".*
