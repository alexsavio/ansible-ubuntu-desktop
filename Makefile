version-var := "version = "
version-string := $(shell grep $(version-var) version.py)
version := $(subst version = ,,$(version-string))

install:
	python3 -m pip install -U pip pipenv setuptools
	pipenv --three --site-packages
	pipenv install --dev --skip-lock

clean: clean-ansible

clean-ansible:
	rm -fr playbook.retry
	rm -fr .ansible_cache/

version:
	@echo v$(version)

tag:
	@echo "Create git tag v$(version), if not present"
	git rev-parse --verify v$(version) || (git tag v$(version) && git push --tags)
