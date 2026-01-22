# The Time Bomb (ONBUILD)

`ONBUILD` instructions don't run now. They run later, when someone uses your image as a base (`FROM your-image`).
It's great for creating "Base" images for teams (e.g., a standard Python wrapper).
