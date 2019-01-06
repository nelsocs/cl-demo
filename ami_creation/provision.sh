#!/bin/bash
set -e
## update packages
sudo yum -y update

## Install ansible ##
sudo yum -y install python-dev python-pip
sleep 10
sudo pip install ansible
sudo /usr/local/bin/ansible-galaxy install dev-sec.os-hardening

