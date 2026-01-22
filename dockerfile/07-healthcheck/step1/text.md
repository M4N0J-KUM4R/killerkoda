# Step 1: The Broken Heart

We'll create a server that works for 5 seconds, then "crashes" (returns partial health), simulating a deadlock.

### Your Mission
1.  Create a `Dockerfile` with a health check:
    ```dockerfile
    FROM alpine
    # Install curl for checking
    RUN apk add --no-cache curl
    
    # Check every 5s. If it fails, mark unhealthy.
    HEALTHCHECK --interval=5s --timeout=3s \
      CMD curl -f http://localhost:80 || exit 1

    # Fake server: Listen on 80. Reply 200 OK.
    # IN REAL LIFE: This would be your app (Node, Python, Go).
    # Here we cheat with netcat (busybox nc).
    CMD while true; do echo -e "HTTP/1.1 200 OK\n\n I am alive" | nc -l -p 80; done
    ```{{exec}}

2.  Build it:
    ```bash
    docker build -t app-health .
    ```{{exec}}

3.  Run it:
    ```bash
    docker run -d --name doctor app-health
    ```{{exec}}

4.  Watch the status change from `starting` to `healthy`:
    ```bash
    watch -n 1 "docker ps | grep doctor"
    ```{{exec}}
    *(Press Ctrl+C after it says `(healthy)`)*

5.  **Sabotage!** Install a "virus" (just kill netcat loop or block the port).
    Actually, let's just create a new container that FAILS the check.
    Override the command to run nothing on port 80.
    ```bash
    docker run -d --name sick-patient app-health sleep infinity
    ```{{exec}}

6.  Watch it go `unhealthy`:
    ```bash
    watch -n 1 "docker ps | grep sick-patient"
    ```{{exec}}
    *After ~15 seconds (3 retries x 5s), it will say `(unhealthy)`.*
