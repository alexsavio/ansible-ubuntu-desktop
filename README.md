# ansible-ubuntu-desktop

Provisioner for my profesional/personal Ubuntu 19.04 Desktop.


# Preparation

```bash
sudo apt install python3-apt
export PATH=$PATH:$HOME/.local/bin
make install
```

# Launch

A `playbook` script entry is set in the Pipfile:

```bash
pipenv run playbook --extra-vars '@group_vars/laptops/xps15/vars.yml'
```