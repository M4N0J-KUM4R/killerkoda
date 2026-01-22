# The Trilogy (plus one) of Storage

Docker has ways to store data:
1.  **Bind Mounts**: Maps a host file/folder into the container. (Great for Dev).
2.  **Named Volumes**: Managed by Docker. Stores data in `/var/lib/docker/volumes`. (Great for Prod).
3.  **Anonymous Volumes**: Managed by Docker, but with a random Hash name. (Usually accidental or temporary).
4.  **Tmpfs**: Stores data in RAM. (Great for secrets/speed).
