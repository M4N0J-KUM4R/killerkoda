# Graceful Exit (STOPSIGNAL)

When you run `docker stop`, Docker sends `SIGTERM`.
If your app ignores it (or runs as PID 1 without handling signals), Docker waits 10s and kills it hard (`SIGKILL`).
`STOPSIGNAL` lets you change the signal sent to stop the container.
