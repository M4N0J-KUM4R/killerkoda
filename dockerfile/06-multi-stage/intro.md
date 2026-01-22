# Dieting (Multi-Stage Builds)

The #1 Rookie Mistake: Leaving build tools (compilers, SDKs) in production images.
**Multi-Stage Builds** let you build in one container and copy *only the artifact* to a tiny container.
