# Moving In (COPY vs ADD)

To get code into your image, you need to copy it from your host.
Docker provides two commands: `COPY` and `ADD`. They look the same, but one has "magic" powers.

**Rule of Thumb:** Use `COPY` unless you need `ADD`'s magic.
