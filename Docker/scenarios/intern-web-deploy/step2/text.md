# Step 2: Containerize and Ship!

Great! The code looks safe. Now we need to package it using Nginx, a high-performance web server.

### Task
1.  Ensure you are in the `/root/app` directory.
2.  Create a file named `Dockerfile`:
    ```bash
    touch Dockerfile
    ```
3.  Add the following content to `Dockerfile`:
    ```dockerfile
    FROM nginx:alpine
    COPY index.html /usr/share/nginx/html/index.html
    ```
    *(You can use `vi`, `nano`, or simply `echo` to create the file)*
    
    Example using echo:
    ```bash
    echo -e "FROM nginx:alpine\nCOPY index.html /usr/share/nginx/html/index.html" > Dockerfile
    ```

4.  Build the image with the tag `spacecat:v1`. Don't forget the dot `.` at the end!
    ```bash
    docker build -t spacecat:v1 .
    ```

5.  Run the container on port 8080:
    ```bash
    docker run -d -p 8080:80 --name spacecat-web spacecat:v1
    ```

### Verify
We will check if:
1.  The image `spacecat:v1` exists.
2.  The container `spacecat-web` is running.
3.  The text "SpaceCat" is accessible on port 8080.
