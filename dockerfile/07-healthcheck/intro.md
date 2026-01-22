# Self-Healing (HEALTHCHECK)

Docker can check if your app is actually working, not just running.
If a container fails its `HEALTHCHECK`, Docker marks it as `unhealthy`. Orchestrators (like Swarm or Kubernetes) can then restart it.
