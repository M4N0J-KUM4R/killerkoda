# Step 2: Running in Background (Detached)
 
We don't want our terminal blocked. Let's run the container in **Detached Mode**.
 
### Your Mission
1.  Run Nginx with the `-d` (detached) flag:
    ```bash
    docker run -d nginx
    ```
    *You'll get a long ID back, but your terminal is free!*
 
2.  Check if it's running:
    ```bash
    docker ps
    ```
