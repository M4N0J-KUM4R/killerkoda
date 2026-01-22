# Anonymous Volumes (The Trap)

If you use `-v /some/path` WITHOUT a name, Docker creates an **Anonymous Volume**.
These are dangerous because they are hard to track and can fill up your disk.

### Your Mission

1.  Run a container with an Anonymous Volume:
    ```bash
    docker run -d --name type-anon -v /anon-data alpine sleep infinity
    ```{{exec}}
    *We didn't give it a name like `my-vol`.*

2.  Inspect to see the random hash name:
    ```bash
    docker inspect --format '{{ json .Mounts }}' type-anon
    ```{{exec}}
    *You'll see a long hash like `35b91...` in the Name field.*

3.  Remove the container:
    ```bash
    docker rm -f type-anon
    ```{{exec}}

4.  List volumes:
    ```bash
    docker volume ls
    ```{{exec}}
    *That hash volume is STILL THERE! This is how "Dangling Volumes" happen.*
