# Different Worlds (Userspaces)

So the *Kernel* is the same. What makes Fedora "Fedora" and Alpine "Alpine"?
It's the **Userspace**: the file system, the package managers (apt vs yum vs apk), and the binaries.

### Your Mission
1.  Check the OS information on the Host:
    ```bash
    cat /etc/os-release
    ```{{exec}}

2.  Check the OS information inside an Alpine container:
    ```bash
    docker run --rm alpine cat /etc/os-release
    ```{{exec}}

3.  Notice the difference? The Kernel (`uname -r`) was the **same**, but the OS files (`/etc/os-release`) are **different**.

4.  Prove you saw the difference by creating a file `os_check.txt` with the ID of the container's OS (which is `alpine`).
    ```bash
    echo "alpine" > os_check.txt
    ```{{exec}}
