# Step 1: Hello, Docker!

The command to start a container is simplicity itself: `docker run`.

### Your Mission
1.  Run the Nginx container:
    ```bash
    docker run nginx
    ```
    *Wait... it's stuck!*
    Nginx is running in the **foreground**, taking over your terminal. This is normal for a process, but annoying for us.

2.  Press `Ctrl+C` to stop it.

3.  Let's run it in the **background** (detached mode) using `-d`:
    ```bash
    docker run -d --name my-web-server nginx
    ```

4.  Check if it's running:
    ```bash
    docker ps
    ```

5.  If you see `my-web-server` in the list, you win!
