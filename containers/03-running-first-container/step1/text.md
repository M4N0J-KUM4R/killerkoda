# The Blocking Container (Foreground)
 
The command to start a container is simplicity itself: `docker run`.
 
### Your Mission
1.  Run the Nginx container:
    ```bash
    docker run nginx
    ```{{exec}}
2.  *Wait... it's stuck!*
    Nginx is running in the **foreground**, taking over your terminal. This is normal for a server, but annoying for us.
 
3.  Press `Ctrl+C` to stop it.
    
4.  Verify it's gone from the running list:
    ```bash
    docker ps
    ```{{exec}}
