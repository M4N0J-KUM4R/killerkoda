# The Ghost Container (--rm)
 
Sometimes you want a container to do a job and disappear immediately, leaving no trace.
 
### Your Mission
1.  Run a container that sleeps for 5 seconds and then **self-destructs** (`--rm`):
    ```bash
    docker run -d --rm --name ghost alpine sleep 5
    ```{{exec}}
 
2.  Watch it run (quickly!):
    ```bash
    docker ps
    ```{{exec}}
 
3.  Wait 5 seconds... and verify it's gone:
    ```bash
    docker ps -a
    ```{{exec}}
    *It shouldn't be in the list, effectively deleted.*
