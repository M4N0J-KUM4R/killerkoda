# Step 1: The Illusion of Isolation (Namespaces)

When you start a container, it thinks it is the only thing running on the machine (PID 1).

### Your Mission
1.  Run a process in the background on the Host:
    ```bash
    sleep 1000 &
    ```
2.  List processes on the Host:
    ```bash
    ps aux | grep sleep
    ```
    *You see it, right?*

3.  Now, launch a container named `iso-test` in the background and check processes inside it:
    ```bash
    docker run -d --name iso-test alpine sleep infinity
    docker exec iso-test ps aux
    ```
    *Can the container see the `sleep 1000` process?* NO.
    
    You only see the container's own processes (PID 1 is sleep).

4.  (Verification) We will check if `iso-test` is running.

