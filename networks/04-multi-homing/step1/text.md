# Step 1: The Bridge Builder

We will create two isolated networks (`public`, `private`) and channel traffic between them.

### Your Mission
1.  Create the isolated networks:
    ```bash
    docker network create public
    docker network create private
    ```{{exec}}

2.  Run the **Database** in the `private` network (Hidden):
    ```bash
    docker run -d --name secure-db --network private alpine sleep infinity
    ```{{exec}}

3.  Run the **Proxy** in the `public` network (Exposed):
    ```bash
    docker run -d --name public-proxy --network public alpine sleep infinity
    ```{{exec}}

4.  Try to reach the DB from the Proxy (Fails):
    ```bash
    docker exec public-proxy ping -c 1 secure-db
    ```{{exec}}
    *Error: `bad address`. They are on different islands.*

5.  **The Fix**: Connect the Proxy to the `private` network (Multi-homing):
    ```bash
    docker network connect private public-proxy
    ```{{exec}}

6.  Try again (Success):
    ```bash
    docker exec public-proxy ping -c 1 secure-db
    ```{{exec}}
    *Success! The proxy now has TWO IP addresses (one in `public`, one in `private`).*

7.  Verify external access is still blocked. Create an "Attacker" in `public` and try to ping DB:
    ```bash
    docker run --rm --network public alpine ping -c 1 secure-db
    ```{{exec}}
    *Error: `bad address`. The Attacker is in `public`, but secure-db is ONLY in `private`.*
