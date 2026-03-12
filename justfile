# install python dependencies
deps-install:
    uv sync --no-dev
    just deps-post

# install dev dependencies
deps-install-dev:
    uv sync
    just deps-post

# install ansible galaxy dependencies
deps-post:
    uv run --active ansible-galaxy collection install -r requirements.yml

clean: clean-ansible

clean-ansible:
    rm -fr playbook.retry
    rm -fr .ansible_cache/

# run provisioning on localhost
local:
    uv run --active ansible-playbook playbook.yml -l local -K

# ensure ssh agent has a key loaded
[private]
ensure-ssh-agent:
    #!/usr/bin/env bash
    if ! ssh-add -l &>/dev/null; then
        ssh-add
    fi

# run provisioning on thinkcentre
thinkcentre: ensure-ssh-agent
    uv run --active ansible-playbook playbook.yml -l thinkcentre -K
