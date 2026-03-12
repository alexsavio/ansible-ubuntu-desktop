# ansible-ubuntu24-desktop

Ansible provisioner for Ubuntu 24 desktop.

## Setup

Install [uv](https://docs.astral.sh/uv/) and [just](https://just.systems/), then:

```bash
just deps-install-dev
```

## Customize

Copy `default.config.yml` to `config.yml` and override any variables. Host-specific overrides go in `group_vars/`.

## Usage

```bash
# Provision localhost
just local

# Provision thinkcentre
just thinkcentre

# Run specific tags only
ansible-playbook playbook.yml -l local -K --tags docker,rust

# Dry run
ansible-playbook playbook.yml -l local -K --check
```

## Tags

| Tag | Description |
|-----|-------------|
| `apt` | System packages |
| `apt_apps` | Desktop applications |
| `docker` | Docker CE |
| `rust` | Rust toolchain + cargo packages |
| `python` | uv installer |
| `uvx` | uv tool packages |
| `zsh` | Oh My ZSH |
| `homeschick` | Dotfiles |
| `claude` | Claude Code + config |
| `vscode` | VSCode extensions |
| `rsync` | File synchronization |
