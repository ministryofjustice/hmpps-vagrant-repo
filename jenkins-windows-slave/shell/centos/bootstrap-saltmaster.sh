#!/bin/bash

echo '### SALTMASTER SETUP'

yum install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm -y

systemctl enable salt-master salt-minion
systemctl start salt-master salt-minion