SHELL := /bin/sh

.DEFAULT: help
.PHONY: install remove clean reinstall

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' | sed 's/@main //g'
	@echo

ansible-download:  ## @main Download phpdevtools ansible role + dependencies
	@ansible-galaxy install -r ./provisioning/requirements.yml --roles-path=./provisioning/roles/

ansible-install: ## @main Install phpdevtools ansible suite
	@sudo ansible-playbook provisioning/provision.yml -vvvv -i provisioning/hosts/local  --diff

install: ansible-download ansible-install ## @main Install phpdevtools

remove: ## @main Remove phpdevtools.
	@echo 'Removing phpdevtols from /usr/local/bin ...'
	@ cd /usr/local/bin && sudo rm codecept \
								   composer \
								   phan \
								   phing \
								   php-cs-fixer \
								   phpcbf \
								   phpcov \
								   phpcpd \
								   phpcs \
								   phploc \
								   phpmd \
								   phpmetrics \
								   phpstan \
								   phpunit \
								   psalm \
								   psysh \
								   shaku
	@echo 'Done.'

clean:  ## @main Clean up the downloaded phpdevtools roles.
	@echo 'Cleaning up the downloaded phpdevtools ansible roles in ./provisioning/roles/ ...'
	@rm -rf ./provisioning/roles/devsoul.*
	@echo 'Done.'

reinstall: clean remove install ## @main Reinstall phpdevtools.
