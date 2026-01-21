# Alone together.

By default, every container is connected to a private network called the **Bridge**.
They can talk to each other, but they need to know *who* they are talking to.

In this lab, we will:
1.  Run two containers.
2.  Make them talk over the private network.
3.  See how Docker uses names to find IP addresses (DNS).
