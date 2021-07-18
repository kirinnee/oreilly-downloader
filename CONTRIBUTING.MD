# Contributing

Contributing to Oreilly downloader is simple with little dependencies.

## Workflow/Tools
- GitHub Action for CD
- pre-commit hooks for linting and formatting
- Nix and Docker for environment management

## Requirements
- Docker Daemon running on machine
- Nix >= 2.3.12
- direnv >= 2.28.0


## Getting Started
1. Clone this repository
2. Allow direnv to install necessary binaries using Nix
  ```bash
  dirnev allow
  ```
3. Use `pls` tool to see what commands you can run (build tool)
  ```bash
  pls --list
  ```
4. Edit `Dockerfile`

### Building images
You can build an image simply by running `pls build`

### Testing download
You can test download using the method similar to users

#### Username/Password Logins

1. Obtain Book ID, eg `9780321635754`
2. Run pls command:
  ```sh
  (pls run -- login <book id> <email:password>) > "<name of your file>.epub"
  ```

#### SSO
1. Obtain Book ID, eg `9780321635754`
2. Obtain SSH credentials (as described in [README.MD](./README.MD) )
2. Run pls command:
  ```sh
  (cat <cookie json file> | pls run -- sso <book id>) > "<name of your file>.epub"
  ```
