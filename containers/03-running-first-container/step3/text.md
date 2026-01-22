# What's Your Name?
 
By default, Docker gives random names like `suspicious_cori`. Let's give it a real name.
 
### Your Mission
1.  Run Nginx with a specific name `my-web-server`:
    ```bash
    docker run -d --name my-web-server nginx
    ```{{exec}}
 
2.  Check the list again to see your named container:
    ```bash
    docker ps
    ```{{exec}}
