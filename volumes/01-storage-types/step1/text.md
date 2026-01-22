# Step 1: Compare the Three

Let's run three containers, each using a different storage type.

### Your Mission
1.  **Bind Mount**: Map the current directory to `/bind`.
    ```bash
    echo "I am from Host" > hostfile.txt
    docker run -d --name type-bind -v $(pwd):/bind alpine sleep infinity
    ```{{exec}}

2.  **Named Volume**: Let Docker manage it.
    ```bash
    docker run -d --name type-named -v my-vol:/named alpine sleep infinity
    ```{{exec}}

3.  **Tmpfs**: In-memory only.
    ```bash
    docker run -d --name type-tmpfs --tmpfs /ramdisk alpine sleep infinity
    ```{{exec}}

4.  **Anonymous Volume**: The dangerous one. Persistent, but hard to find.
    ```bash
    docker run -d --name type-anon -v /anon-data alpine sleep infinity
    ```{{exec}}

4.  **Verify**:
    - **Bind**: You should see `hostfile.txt` inside.
      ```bash
      docker exec type-bind ls /bind
      ```{{exec}}
    - **Named**: It should be empty (but persistent).
      ```bash
      docker exec type-named ls /named
      ```{{exec}}
    - **Tmpfs**: Write a file, stop container, start it -> File GONE.
      ```bash
      docker exec type-tmpfs sh -c "echo 'I see you' > /ramdisk/ghost"
      docker restart type-tmpfs
      docker exec type-tmpfs ls /ramdisk
      ```{{exec}}
      *Output should be empty! RAM was cleared on restart.*
    - **Anonymous**: Inspect to see the random hash name.
      ```bash
      docker inspect --format '{{ json .Mounts }}' type-anon
      ```{{exec}}
