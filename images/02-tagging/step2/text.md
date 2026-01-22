# Step 2: The Digest (Immutable Truth)

Tags (`:latest`, `:v1`) are mutable. Anyone can move the `:v1` sticker to a different image.
**Digests** (`sha256:...`) are immutable. They are the cryptographic fingerprint of the content.

### Your Mission
1.  View the digests of your images:
    ```bash
    docker images --digests
    ```{{exec}}
    *See the long `DIGEST` column? That never changes for the same content.*

2.  Pull an image by its **Digest** (Exact verification):
    ```bash
    docker pull alpine@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e31e7df81f271aa446003668814
    ```{{exec}}
    *(Note: The hash above is an example. In a real scenario, you'd use a specific known hash. Since `alpine` updates frequently, running this command might pull an older layer or say "Image is up to date" if you happen to have it. The key is the syntax: `image@digest`)*

3.  Let's simulate a "Supply Chain Attack" (modifying a tag).
    Retag your `my-curl-image` (from the previous module, or just use alpine) as `safe-image:latest`:
    ```bash
    docker tag alpine safe-image:latest
    ```{{exec}}

4.  Now point `safe-image:latest` to something else (the ubuntu image):
    ```bash
    docker tag ubuntu safe-image:latest
    ```{{exec}}
    *See? The tag `safe-image:latest` now points to Ubuntu. If you trusted the **Tag**, you got tricked.*

5.  Create a file `security.txt` with the word "DIGEST" if you agree that Digests are safer than Tags for production.
    ```bash
    echo "DIGEST" > security.txt
    ```{{exec}}
