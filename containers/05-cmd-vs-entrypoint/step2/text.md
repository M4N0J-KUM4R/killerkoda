# Step 2: ENTRYPOINT (The Law)

`ENTRYPOINT` defines the **executable** that will ALWAYS run.
Any arguments passed to `docker run` get **appended** to it (they become the CMD).

### Your Mission
1.  Create a Dockerfile where `sleep` is the Entrypoint:
    ```bash
    echo 'FROM alpine' > Dockerfile.entry
    echo 'ENTRYPOINT ["sleep"]' >> Dockerfile.entry
    echo 'CMD ["5"]' >> Dockerfile.entry
    ```
    *Translation: "I am a SLEEP machine. By default, I sleep for 5 seconds."*

2.  Build it:
    ```bash
    docker build -f Dockerfile.entry -t sleep-entry .
    ```

3.  Run it (Defaults to `sleep 5`):
    ```bash
    time docker run sleep-entry
    ```

4.  Now try to override it like before:
    ```bash
    time docker run sleep-entry 2
    ```
    *It did NOT echo "2". It SLEPT for 2 seconds.*
    Why? Because `2` became the argument for `sleep`. The command actually ran was `sleep 2`.

5.  Create a file `entry_rule.txt` saying "APPEND" because arguments are appended to Entrypoint.
    ```bash
    echo "APPEND" > entry_rule.txt
    ```
