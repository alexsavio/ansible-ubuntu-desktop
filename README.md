# ansible-ubuntu-desktop

Provisioner for my profesional/personal Ubuntu 19.04 Desktop.

## Preparation

Activate your Python environment, and then:

```bash
make install
```

## Customize

Remember to create a new set of group variables in group_vars.
You can copy the file in: `group_vars/laptops/xps15/vars.yml` and replace
their values.

## Launch

In order to Ansible find the python3-apt installation,
one way of doing it is with:

```bash
export PYTHONPATH=/usr/lib/python3/dist-packages/
```

A `playbook` script entry is set in the Pipfile:

```bash
ansible-playbook -K --extra-vars '@group_vars/laptops/xps15/vars.yml' playbook.yml
```
