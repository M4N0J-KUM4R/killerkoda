# The Waiting Game

Common Error: `Connection Refused` on startup.
Why? Your Web App started *before* the Database was ready to accept connections.
`depends_on` alone is NOT enough (it only waits for the container to start, not the app inside).
You need **Healthchecks**.
