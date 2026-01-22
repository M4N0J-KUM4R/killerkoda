# Step 1: Stop vs Kill

There are two ways to stop a container:
1.  `docker stop`: Sends `SIGTERM`. "Please finish what you are doing and shut down." (Polite)
2.  `docker kill`: Sends `SIGKILL`. "DIE NOW." (Rude)

### Your Mission
1.  Start a container that ignores `SIGTERM` (it's stubborn):
    ```bash
    docker run -d --name stubborn-app alpine sh -c "trap 'echo I refuse to die' TERM; sleep infinity"
    ```{{exec}}
2.  Try to stop it politely:
    ```bash
    time docker stop stubborn-app
    ```{{exec}}
    *Observe that it takes 10 seconds!* Docker waited 10s, realized the app wasn't listening, and then killed it.

3.  Start it again:
    ```bash
    docker start stubborn-app
    ```{{exec}}

4.  Now KILL it:
    ```bash
    time docker kill stubborn-app
    ```{{exec}}
    *Instant death.*

5.  Create a file `lifecycle.txt` with the word "INSTANT" if `docker kill` was faster than `docker stop`.
    ```bash
    echo "INSTANT" > lifecycle.txt
    ```{{exec}}
