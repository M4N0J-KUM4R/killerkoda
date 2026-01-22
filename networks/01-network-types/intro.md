# The Network Inventory

Docker isn't limited to just "Bridges". It has a driver for every use case.
1.  **Bridge**: The default. Isolated islands on a single host.
2.  **Host**: No isolation. Maximum speed.
3.  **None**: No network. Maximum security.
4.  **Overlay**: Connects containers across *multiple* hosts (Swarm).
5.  **Macvlan**: Assigns a real MAC address to the container (appears as a physical device).
