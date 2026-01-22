# Step 1: Ping Pong (The Bridge Network)

Containers on the default bridge can communicate by IP, but not by Name.
To communicate by Name, we need a **User Defined Bridge**.

### Your Mission
1.  Create a network named `space-net`:
    ```bash
    docker network create space-net
    ```
2.  Run a container named `pluto` on this network:
    ```bash
    docker run -d --name pluto --network space-net alpine sleep infinity
    ```
3.  Run a container named `mars` on the same network:
    ```bash
    docker run -d --name mars --network space-net alpine sleep infinity
    ```
4.  From `mars`, try to ping `pluto`:
    ```bash
    docker exec mars ping -c 2 pluto
    ```
    *It works! Docker's internal DNS resolved "pluto" to its IP address.*

5.  Create a file `connection.txt` with "SUCCESS" if the ping worked.
    ```bash
    if [ $? -eq 0 ]; then echo "SUCCESS" > connection.txt; fi
    ```
