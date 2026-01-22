# Step 4: Port Conflict (Address In Use)

One of the most common errors: Two containers want the same port.

### Your Mission
1.  Run an Nginx on port 8080:
    ```bash
    docker run -d --name web1 -p 8080:80 nginx
    ```

2.  Try to run ANOTHER Nginx on the SAME port:
    ```bash
    docker run -d --name web2 -p 8080:80 nginx
    ```
    *Error: Bind for 0.0.0.0:8080 failed: port is already allocated.*

3.  Fix it! Run the second web server on port **9090** instead:
    ```bash
    docker run -d --name web2 -p 9090:80 nginx
    ```
