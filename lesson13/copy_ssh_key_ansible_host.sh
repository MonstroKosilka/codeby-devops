#!/bin/env bash
export SSH_HOME=/home/$USER/.ssh
export TMS_SSH_KEY=codeby_ansible_id_rsa

cp ./vagrant/ssh_key/id_rsa $SSH_HOME/$TMS_SSH_KEY
chmod 400 $SSH_HOME/$TMS_SSH_KEY
