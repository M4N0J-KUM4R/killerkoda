# Step 1: The Magic Name

We will run multiple containers with the SAME alias. Docker will rotate the IP returned for that name.

### Your Mission
1.  Create a network:
    ```bash
    docker network create auth-net
    ```{{exec}}

2.  Run **Instance 1** of our "Service":
    ```bash
    docker run -d --network auth-net --network-alias auth-svc --name auth-1 alpine sleep infinity
    ```{{exec}}

3.  Run **Instance 2** with the SAME alias:
    ```bash
    docker run -d --network auth-net --network-alias auth-svc --name auth-2 alpine sleep infinity
    ```{{exec}}

4.  Run a Client and verify DNS Round Robin:
    ```bash
    docker run --rm --network auth-net alpine nslookup auth-svc
    ```{{exec}}
    *You should see TWO IP addresses listed!*

5.  Ping it repeatedly (Simulating traffic):
    ```bash
    docker run --rm --network auth-net alpine ping -c 4 auth-svc
    ```{{exec}}
    *Docker will resolve `auth-svc` to one of the IPs. On subsequent lookups, it rotates.*

6.  Create a file `lb_proof.txt` saying "BALANCED" to understand this built-in power.
    ```bash
    echo "BALANCED" > lb_proof.txt
    ```{{exec}}
