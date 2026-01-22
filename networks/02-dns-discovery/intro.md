# The Network Bridge

Docker has a "Default Bridge" (`bridge`) that all containers attach to by default.
**Problem**: It does NOT support DNS Resolution.
**Solution**: Create your own "User-Defined Bridge".
