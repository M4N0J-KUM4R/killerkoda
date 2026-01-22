# Crash Course (Immediate Exit)

Sometimes a container starts and dies immediately. Docker calls this "Exited". Kubernetes calls it "CrashLoopBackOff".

### Your Mission
1.  Run this broken container:
    ```bash
    docker run -d --name crasher alpine sh -c "echo I am dying...; exit 1"
    ```{{exec}}

2.  Check if it's running:
    ```bash
    docker ps
    ```{{exec}}
    *It's gone!*

3.  Check the "Dead" list:
    ```bash
    docker ps -a
    ```{{exec}}
    *Status: Exited (1)*

4.  Find out WHY it died using logs:
    ```bash
    docker logs crasher
    ```{{exec}}
