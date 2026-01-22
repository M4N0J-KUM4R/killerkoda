# Internal Load Balancing

What if you have **3 replicas** of an Authentication Service?
How does the Frontend know which IP to talk to?
Docker has a built-in **DNS Round Robin** load balancer.
