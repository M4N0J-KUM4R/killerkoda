# Step 1: Birth (Create vs Start)

Usually, `docker run` does everything: pulls image, creates container, starts it.
But sometimes you want to prepare a container without running it yet.

### Your Mission
1.  **Create** a container (but don't start it):
    ```bash
    docker create --name born-ready alpine sleep infinity
    ```{{exec}}

2.  Check its status:
    ```bash
    docker ps -a
    ```{{exec}}
    *Status should be `Created`.*

3.  Now, **Start** it:
    ```bash
    docker start born-ready
    ```{{exec}}

4.  Check status again:
    ```bash
    docker ps
    ```{{exec}}
    *Now it's `Up` (Running)!*
