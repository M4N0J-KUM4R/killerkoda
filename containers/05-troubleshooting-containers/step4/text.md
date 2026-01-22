# Port Conflict (Address In Use)

One of the most common errors: Two containers want the same port.

### Your Mission
1.  Run an Nginx on port 8080:
    ```bash
    docker run -d --name web1 -p 8080:80 nginx
    ```{{exec}}

2.  Try to run ANOTHER Nginx on the SAME port:
    ```bash
    docker run -d --name web2 -p 8080:80 nginx
    ```{{exec}}
    *Error: Bind for 0.0.0.0:8080 failed: port is already allocated.*

3.  Fix it! Run the second web server on port **9090** instead:
    ```bash
    docker run -d --name web2 -p 9090:80 nginx
    ```{{exec}}
    *Error: Conflict. The container name "/web2" is already in use by container ...*

4.  Fix it! Remove the old web server and run the fixed web server:
    ```bash
    docker rm -f web2
    docker run -d --name web2 -p 9090:80 nginx
    ```{{exec}}