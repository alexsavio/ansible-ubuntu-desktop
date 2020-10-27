version := $(shell python -c 'import version; print(version.__version__)')

python-apt:
	wget -c http://de.archive.ubuntu.com/ubuntu/pool/main/p/python-apt/python3-apt_2.0.0_amd64.deb
	dpkg-deb -xv python3-apt_2.0.0_amd64.deb .
	mv usr/lib/python3/dist-packages/* $(shell python -c "import site; print(site.getsitepackages()[0])")
	rm -rf usr

pyenv:
	pyenv virtualenv 3.8.5 ansible
	pyenv local ansible
	pyenv activate ansible

install-build::
	python -m pip install -U pip setuptools poetry

install:: install-build python-apt
	poetry install --no-dev

install::
	ansible-galaxy collection install -r requirements.yml

install-dev:: install
	pre-commit install

install-ci:: install-build
	poetry install

clean: clean-ansible

clean-ansible:
	rm -fr playbook.retry
	rm -fr .ansible_cache/

version:
	@echo v$(version)

tag:
	@echo "Create git tag v$(version), if not present"
	git rev-parse --verify v$(version) || (git tag v$(version) && git push --tags)

release::
	semantic-release version

release::
	poetry version v$(version)

release::
	semantic-release publish
