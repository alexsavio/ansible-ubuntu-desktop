install:
	pip install -U pip pipenv setuptools
	pipenv install --dev --skip-lock

clean: clean-ansible

clean-ansible:
	rm -fr playbook.retry
	rm -fr .ansible_cache/

