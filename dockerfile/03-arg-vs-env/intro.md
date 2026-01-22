# Build vs Runtime (ARG vs ENV)

Variables make your Dockerfiles flexible.
- **ARG** is for **Building** (Installing dependencies, setting versions). It disappears at runtime.
- **ENV** is for **Running** (Database URLs, API Modes). It stays forever.
