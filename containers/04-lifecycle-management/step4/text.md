# The Immortal Container (Restart Policies)

In production, apps crash. We want them to come back automatically.
Docker has a feature for this: `--restart`.

### Your Mission
1.  Run a container that is destined to fail (exit) immediately, but ask Docker to always restart it:
    ```bash
    docker run -d --name zombie --restart always alpine sh -c "echo 'Brains...'; sleep 2; exit 1"
    ```{{exec}}

2.  Watch it crash and restart:
    ```bash
    watch docker ps
    ```{{exec}}
    *Wait a few seconds and run `docker ps` again. Look at the "STATUS" column. It will say "Up X seconds" (resetting continuously).*

3.  Inspect the Restart Policy to confirm it is set to "always":
    ```bash
    docker inspect zombie | grep RestartPolicy -A 2
    ```{{exec}}

4.  We need to put this zombie to rest. To remove a restarting container, you must force remove it:
    ```bash
    docker rm -f zombie
    ```{{exec}}
