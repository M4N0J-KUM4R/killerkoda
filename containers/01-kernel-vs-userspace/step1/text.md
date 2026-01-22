# Step 1: One Kernel to Rule Them All

If containers share the host's kernel, then `uname -r` (which prints the kernel release) should be identical inside and outside the container.

### Your Mission
1.  Check the Host's Kernel:
    ```bash
    uname -r
    ```
    *Write this down (or remember it).*

2.  Start a container using a completely different Operating System (Fedora) and check *its* kernel:
    ```bash
    docker run --rm fedora uname -r
    ```

3.  Compare them. Are they the same?

4.  Create a file named `kernel_check.txt` with the word "SAME" if they match.
    ```bash
    echo "SAME" > kernel_check.txt
    ```

**Explanation**: Even though we ran Fedora (which usually has a different kernel than Ubuntu), the container reused the Host's Ubuntu kernel!
