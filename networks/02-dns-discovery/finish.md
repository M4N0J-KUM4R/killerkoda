# Connected.

Rule #1 of Docker Networking: **Always create a custom bridge.**
It gives you:
1.  **DNS Resolution**: Container A can find Container B by name.
2.  **Isolation**: Only containers on this network can talk to each other.
