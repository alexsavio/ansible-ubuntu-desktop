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
    ansible-galaxy collection install -r requirements.yml

clean: clean-ansible

clean-ansible:
    rm -fr playbook.retry
    rm -fr .ansible_cache/

# run provisioning on localhost
local:
    ansible-playbook playbook.yml -l local -K

# run provisioning on thinkcentre
thinkcentre:
    ansible-playbook playbook.yml -l thinkcentre
