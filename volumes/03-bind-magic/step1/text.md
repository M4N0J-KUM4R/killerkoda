# Live Edits

We will run a web server and modify its content from the host, seeing changes instantly.

### Your Mission
1.  Create an `index.html` on the host:
    ```bash
    echo "<h1>Version 1</h1>" > index.html
    ```{{exec}}

2.  Run Nginx with a Bind Mount pointing to this file:
    ```bash
    docker run -d -p 8080:80 --name web-dev -v $(pwd)/index.html:/usr/share/nginx/html/index.html nginx
    ```{{exec}}

3.  Check the content:
    ```bash
    curl localhost:8080
    ```{{exec}}
    *Output: `<h1>Version 1</h1>`*

4.  **The Magic**: Edit the file on the **Host** (that's you).
    ```bash
    echo "<h1>Version 2 - Updated!</h1>" > index.html
    ```{{exec}}

5.  Check the container again **immediately** (No rebuild needed):
    ```bash
    curl localhost:8080
    ```{{exec}}
    *Output: `<h1>Version 2 - Updated!</h1>`. Magic!*
