# Step 2: Frozen in Time (Pause)

You can freeze a container's processes without stopping them completely.

### Your Mission
1.  Run a container:
    ```bash
    docker run -d --name time-machine alpine sleep infinity
    ```{{exec}}

2.  **Pause** it:
    ```bash
    docker pause time-machine
    ```{{exec}}

3.  Check status:
    ```bash
    docker ps
    ```{{exec}}
    *Status: `Up ... (Paused)`*

4.  **Unpause** it to resume time:
    ```bash
    docker unpause time-machine
    ```{{exec}}
