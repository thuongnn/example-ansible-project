#!/bin/bash

set -e

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Start run ansible playbook
if [[ ! -f "$CURRENT_DIR/playbooks/$1.yml" ]]
then
    echo "---
Error: playbook-name does not exist! check again in playbooks folder.
Example:
  path: playbooks/docker.yml
  Run this playbook by command: ./install.sh docker
"
else
  PLAYBOOK_NAME=$1
  PLAYBOOK_ACTION="install"
  if [ "$PLAYBOOK_NAME" = "uninstall" ]; then
    PLAYBOOK_ACTION="uninstall"
  fi

  echo "Run playbook $PLAYBOOK_NAME.yml..."
  docker run --rm -it \
    -e ANSIBLE_CONFIG=/ansible-playbooks/ansible.cfg \
    -e ANSIBLE_LOG_PATH=/ansible-playbooks/logs/"$PLAYBOOK_NAME""_$(date +%Y%m%d_%H%M%S)".log \
    --net=host \
    -v "$CURRENT_DIR":/ansible-playbooks \
    -v "$CURRENT_DIR/playbooks/$PLAYBOOK_NAME.yml":/ansible-playbooks/install.yml \
    ansible:2.9 \
    ansible-playbook /ansible-playbooks/install.yml -e playbook_action=$PLAYBOOK_ACTION

  echo "Cleanup..."
  rm -rf "$CURRENT_DIR/install.yml"
fi