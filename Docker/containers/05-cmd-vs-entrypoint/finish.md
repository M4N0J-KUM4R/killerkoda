# Bomb Defused.

You now know the secret formula:
`Actual Command = ENTRYPOINT + CMD`

-   Use **CMD** when you want to provide defaults but let the user run whatever they want (e.g., a web server).
-   Use **ENTRYPOINT** when you want your container to behave like a specific binary (e.g., a utility tool like `git` or `sleep`).

You are now safe from unexpected container explosions.
