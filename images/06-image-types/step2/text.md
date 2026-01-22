# Step 2: The "Shell" Shock

Why use Distroless? Security.
Hackers love shells (`bash`, `sh`). If they hack your app, they want to run commands.
**Distroless images have NO shell.**

### Your Mission
1.  Try to run a shell in **Alpine** (it works):
    ```bash
    docker run --rm -it alpine sh
    ```{{exec}}
    *(Type `exit` to quit)*

2.  Try to run a shell in **Distroless** (it fails):
    ```bash
    docker run --rm -it gcr.io/distroless/static-debian12 sh
    ```{{exec}}
    *Error: `exec: "sh": executable file not found in $PATH`*

3.  This is a feature, not a bug! 
    It forces you to debug differently (using logs or ephemeral debug containers) but keeps your production environment lock-tight.

4.  Create a file `secure.txt` confirming you understand this creates a smaller attack surface.
    ```bash
    echo "NO_SHELL" > secure.txt
    ```{{exec}}
