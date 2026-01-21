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

3.  Now, launch a container and look for that process:
    ```bash
    docker run --rm alpine ps aux
    ```
    *Can the container see the `sleep 1000` process?* NO.

4.  Look at the PID (Process ID) inside the container:
    ```bash
    docker run --rm alpine sh -c "echo My PID is \$\$"
    ```
    It thinks it is PID 1! (Or very close to it).

5.  Create a file `namespace.txt` answering this question:
    "Does the container see host processes?" (YES/NO)
    ```bash
    echo "NO" > namespace.txt
    ```
