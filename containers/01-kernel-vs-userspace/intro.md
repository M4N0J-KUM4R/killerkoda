# The Red Pill: What is a Container?

Welcome,

You've heard that **Docker containers** are "lightweight virtual machines". That is a lie.
Unlike a Virtual Machine (VM) which has its own Kernel, a Docker container **shares** the Kernel of the host machine.

In this lab, we are going to prove it.

### What you will learn:
1.  **The Kernel** is the engine room (hardware drivers, memory management).
2.  **Userspace** is the furniture (shells, libraries, tools).
3.  Containers swap the furniture but keep the engine.

Ready to see how deep the rabbit hole goes?
