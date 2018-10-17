#!/bin/bash

echo '### SALTMASTER SETUP'

mkdir /data/salt

ln -sf /srv/salt /data/salt

yum install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm -y

yum install -y salt-master salt-minion git

systemctl enable salt-master salt-minion
systemctl start salt-master salt-minion

echo 'auto_accept: True' > /etc/salt/master.d/master.conf
systemctl restart salt-master

yum install -y epel-release

yum install python-pygit2 -y

salt-run winrepo.genrepo
salt-run winrepo.update_git_repos

salt -G 'os:Windows' pkg.refresh_db