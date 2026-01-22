# Choosing the Right Base

- **Ubuntu/Debian**: Best for getting started. Has everything. Big.
- **Alpine**: Best general-purpose production image. Tiny. Uses `musl` (can cause compatibility issues with some C binaries).
- **Distroless**: Best for security. No shell. Hard to debug.
- **Scratch**: The absolute minimum. For static binaries only (Go, Rust).
