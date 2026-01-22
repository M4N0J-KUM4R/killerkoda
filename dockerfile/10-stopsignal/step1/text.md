# Step 1: Changing the Signal

Some legacy apps (like Nginx) prefer `SIGQUIT` or `SIGWINCH` for graceful shutdown.
Let's tell Docker to use `SIGUSR1` instead of `SIGTERM`.

### Your Mission
1.  Create a Dockerfile that traps signals:
    ```dockerfile
    FROM alpine
    # We use 'trap' to catch the signal and print a message
    STOPSIGNAL SIGUSR1
    CMD trap "echo 'Received SIGUSR1 - Shutting down gracefully...'; exit 0" USR1; \
        echo "Waiting for signal..."; \
        while true; do sleep 1; done
    ```{{exec}}

2.  Build it:
    ```bash
    docker build -t app-signal .
    ```{{exec}}

3.  Run it:
    ```bash
    docker run -d --name polite-app app-signal
    ```{{exec}}

4.  Stop it and watch the logs:
    ```bash
    docker stop polite-app
    docker logs polite-app
    ```{{exec}}
    *You should see "Received SIGUSR1". If we didn't use STOPSIGNAL, it would have received SIGTERM and done nothing (until killed).*
