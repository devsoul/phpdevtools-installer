#!/usr/bin/env sh

ansible-galaxy install -r ./provisioning/requirements.yml --roles-path=./provisioning/roles/
ansible-playbook provisioning/provision.yml -vvvv -i provisioning/hosts/local  --diff --ask-become-pass
