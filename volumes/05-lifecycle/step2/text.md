# The Backdoor (Docker Copy)

What if you just want to copy files IN/OUT without restarting the container?
You can use `docker cp`. It works like `scp` (Secure Copy) but for containers.

### Your Mission

1.  Create a local file:
    ```bash
    echo "I slipped in" > slip.txt
    ```{{exec}}

2.  Copy it INTO the container:
    ```bash
    docker cp slip.txt forgetful-app:/data/slip.txt
    ```{{exec}}

3.  Verify the file is inside:
    ```bash
    docker exec forgetful-app cat /data/slip.txt
    ```{{exec}}
    *Output: `I slipped in`*

4.  Copy it OUT of the container (Backup):
    ```bash
    docker cp forgetful-app:/data/slip.txt ./slip_backup.txt
    cat slip_backup.txt
    ```{{exec}}
