# The Hot-Swap Myth (Lifecycle)

Common question: *"How do I mount a volume to a running container?"*
Answer: **You Don't.**
Containers are immutable. To change the storage, you must destroy the old container and create a new one. This is the **Recreation Pattern**.
