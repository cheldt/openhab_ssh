# ohab_img

A custom [openHAB](https://www.openhab.org/) Docker image based on `openhab/openhab:latest`, with `openssh-client` installed on top.

## Image

Published to GitHub Container Registry:

```
ghcr.io/cheldt/ohab_img:latest
```

Tags are published as `latest` and as the short commit SHA of the build.

## Automation

- **Build and Push** (`.github/workflows/docker-build.yml`): runs daily, on every push to `main` that touches `Dockerfile`, and on manual dispatch. It compares the digest of `openhab/openhab:latest` against the digest stored in `base-image-digest.txt`, and only rebuilds and pushes the image when the base image has changed (or the workflow was triggered manually/by a push). After a build, it commits the updated digest back to the repository.
- **Cleanup Old Packages** (`.github/workflows/cleanup.yml`): runs weekly to remove old container package versions from GHCR, keeping the 2 most recent.

## Usage

```bash
docker pull ghcr.io/cheldt/ohab_img:latest
docker run -d --name openhab ghcr.io/cheldt/ohab_img:latest
```

Refer to the [openHAB Docker documentation](https://hub.docker.com/r/openhab/openhab) for volume, port, and configuration options — this image only adds `openssh-client` on top of the upstream base.

## License

MIT — see [LICENSE](LICENSE).
