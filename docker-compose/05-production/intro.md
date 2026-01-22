# Production Ready

In Prod, you care about two things:
1.  **Uptime**: If it crashes, restart it. (`restart: always`)
2.  **Resources**: Any service effectively can DOS the server. (`limits`)
3.  **Scale**: Handling traffic. (`--scale`)
