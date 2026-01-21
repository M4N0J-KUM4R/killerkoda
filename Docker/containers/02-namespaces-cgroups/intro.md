# How do containers actually work?

"Container" is just a fancy word for a process that has been lied to.

The Linux Kernel lies to the process about:
1.  **Who else is home** (PID Namespaces)
2.  **Where the files are** (Mount Namespaces)
3.  **Who it is** (User Namespaces)
4.  **Where the network is** (Net Namespaces)

These lies are called **Namespaces**.

Then, the Kernel constrains the process:
"You can only have 512MB of RAM!"
This constraint is called **Control Groups (cgroups)**.

Let's peek under the hood.
