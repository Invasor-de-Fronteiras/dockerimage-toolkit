# dockerimage-toolkit

Alpine-based toolkit image used in Kubernetes Jobs and init containers across the Invasor de Fronteiras infrastructure.

## Image

```
ghcr.io/invasor-de-fronteiras/dockerimage-toolkit:<version>
```

## Included tools

| Tool | Source |
|---|---|
| `psql` | `postgresql-client` (Alpine) |
| `kubectl` | Latest stable from dl.k8s.io |
| `aws` | `awscli` via pip |
| `python3` | Alpine package |
| `curl`, `bash` | Alpine packages |

## Usage

### Interactive shell

```sh
docker run --rm -it ghcr.io/invasor-de-fronteiras/dockerimage-toolkit:1.0.0
```

### Kubernetes Job example

```yaml
containers:
  - name: my-job
    image: ghcr.io/invasor-de-fronteiras/dockerimage-toolkit:1.0.0
    command:
      - /bin/bash
      - -c
      - |
        psql -h my-postgres -U postgres -c "SELECT 1;"
```

## Release

Versioning follows [Conventional Commits](https://www.conventionalcommits.org/). A push to `main` with releasable commits triggers semantic-release and publishes a new image to GHCR automatically.
