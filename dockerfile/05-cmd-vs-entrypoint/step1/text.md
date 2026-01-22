# Step 1: CMD (The Suggestion)

`CMD` allows you to define a default command that runs when the container starts.
Crucially, **it can be ignored** if the user provides a different command.

### Your Mission
1.  Create a Dockerfile that sleeps for 5 seconds by default:
    ```bash
    echo 'FROM alpine' > Dockerfile.cmd
    echo 'CMD ["sleep", "5"]' >> Dockerfile.cmd
    ```
2.  Build it:
    ```bash
    docker build -f Dockerfile.cmd -t sleep-cmd .
    ```
3.  Run it without arguments (It uses the default `sleep 5`):
    ```bash
    time docker run sleep-cmd
    ```
    *It takes 5 seconds.*

4.  **Override** the CMD. Tell it to `echo "Hello"` instead:
    ```bash
    docker run sleep-cmd echo "Hello"
    ```
    *It ignores the sleep and just says Hello!*

5.  Prove you understand by creating a file `cmd_rule.txt` saying "OVERRIDE" because CMD can be overridden.
    ```bash
    echo "OVERRIDE" > cmd_rule.txt
    ```
