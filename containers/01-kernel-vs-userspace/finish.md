# You know Kung Fu.

You have successfully demonstrated the core concept of containerization:
**Shared Kernel, Isolated Userspace.**

### Why does this matter?
-   **Speed**: No need to boot a new kernel (like a VM).
-   **Efficiency**: Less overhead.
-   **Portability**: You carry your userspace (libraries, dependencies) with you in the image.

Next, we will look at the magic spells that make this isolation possible: **Namespaces** and **Cgroups**.
