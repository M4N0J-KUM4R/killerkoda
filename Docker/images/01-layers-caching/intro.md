# Docker Images are like Onions

They have layers!
Every instruction in a Dockerfile adds a new layer.
If you don't change anything in a layer, Docker reuses it (Caching).

In this lab, we will verify that images are indeed built from stacking changes on top of each other.
