# Introduction to Persistence

Containers are ephemeral. When you remove them, their filesystem is gone.
To keep data, we must bridge the gap between the Container's world and the Host's world.

We have two main tools:
1.  **Bind Mounts**: "Map this exact folder on my Mac/PC to inside the container."
2.  **Volumes**: "Docker, please manage a safe place for my data."

Let's start with Bind Mounts.
