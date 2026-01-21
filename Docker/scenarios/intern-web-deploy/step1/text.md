# Step 1: Inspect the Code

Alex has placed the code in a folder named `app`. Let's take a look at what we're working with.

It's always good practice to inspect the files before wrapping them in a container, to ensure we aren't shipping secrets or unnecessary files.

### Task
1.  Navigate to the `/root/app` directory:
    ```bash
    cd /root/app
    ```
2.  List the files to see the `index.html`.
3.  Read the content of `index.html`.
    ```bash
    cat index.html
    ```
4.  Once you have verified the code is safe, create a confirmation file to proceed:
    ```bash
    touch checked.txt
    ```
