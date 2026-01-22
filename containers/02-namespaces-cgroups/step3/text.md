# Step 3: Breaking the Illusion (Shared Namespaces)

By default, containers have their own PID namespace. But what if we want two containers to talk like they are on the same machine? We can **share** namespaces.

### Your Mission
1.  Run a background container named `target-app`:
    ```bash
    docker run -d --name target-app alpine sleep infinity
    ```

2.  Run a second container that joins the **PID namespace** of `target-app`:
    ```bash
    docker run --rm --pid=container:target-app alpine ps aux
    ```
    *Look! You can see the `sleep infinity` process from the first container!*

3.  Verify they are sharing the same PID namespace by checking the PID of the sleep process.

4.  Create a file `shared.txt` to confirm success (Docker will verify the container execution).
    ```bash
    echo "SHARED" > shared.txt
    ```
