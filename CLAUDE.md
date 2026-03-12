# CLAUDE.md

Ansible provisioner for Ubuntu 24 desktop setup.

## Project Structure

```
default.config.yml          # All package lists and configuration variables
playbook.yml                # Main playbook entry point
hosts.yml                   # Inventory (localhost + homeservers)
roles/
  main/
    tasks/
      main.yml              # Task orchestration (includes all task files)
      apt.yml               # APT system packages
      apt_apps.yml          # APT desktop applications
      docker.yml            # Docker installation
      rust.yml              # Cargo packages
      python.yml            # uv installation
      uvx.yml               # uv tool packages
      claude.yml            # Claude Code installation and config
      vscode.yml            # VSCode extensions
      zsh.yml               # Shell setup
      homeschick.yml        # Dotfiles via homesick
      home_folders.yml      # Directory structure
      rsync.yml             # File sync
    files/
      claude/               # Claude Code config files
        CLAUDE.md           # Global instructions (~/.claude/CLAUDE.md)
        settings.json       # Claude Code settings (~/.claude/settings.json)
        skills/             # Custom slash commands (~/.claude/skills/)
        commands/           # Custom commands (~/.claude/commands/)
  hardware/                 # Hardware-specific tasks (disabled by default)
```

## Commands

```bash
# Install dependencies
just deps-install-dev

# Run full provisioning on localhost
just local

# Run on thinkcentre
just thinkcentre

# Run specific tags
ansible-playbook playbook.yml -l local -K --tags docker

# Dry run
ansible-playbook playbook.yml -l local -K --check
```

## Conventions

- Package lists live in `default.config.yml`, not in task files
- Host-specific overrides go in `group_vars/`
- Task files are organized by tool/category
- Use `uv` for Python dependency management (not poetry)
