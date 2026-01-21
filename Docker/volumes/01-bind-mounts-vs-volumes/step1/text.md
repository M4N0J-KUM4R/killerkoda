# Step 1: Bind Mounts

A Bind Mount maps a host file or directory to a container file or directory.

### Your Mission
1.  We have created a folder `/root/host-data` on the host.
2.  Run an Alpine container and mount this folder to `/data` inside the container:
    ```bash
    docker run -d --name binder -v /root/host-data:/data alpine sleep infinity
    ```
3.  Check if the container can see the secret file:
    ```bash
    docker exec binder cat /data/secret.txt
    ```
4.  Create a file `verify_mount.txt` with the content of that secret file.
    ```bash
    docker exec binder cat /data/secret.txt > verify_mount.txt
    ```
