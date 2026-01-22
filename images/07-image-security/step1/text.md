# The Root Problem

By default, Docker containers run as **Root**. This means if a hacker escapes the container, they are Root on your host.

### Your Mission
1.  Check the user of the standard `nginx` image:
    ```bash
    docker run --rm nginx id
    ```{{exec}}
    *Output: `uid=0(root)` -> DANGEROUS*

2.  Check the user of the `nginxinc/nginx-unprivileged` image (Best Practice):
    ```bash
    docker run --rm nginxinc/nginx-unprivileged id
    ```{{exec}}
    *Output: `uid=101(nginx)` -> SAFER*

3.  Try to touch a protected file inside the unprivileged image:
    ```bash
    docker run --rm nginxinc/nginx-unprivileged touch /boot/test
    ```{{exec}}
    *Permission denied! This is what we want.*