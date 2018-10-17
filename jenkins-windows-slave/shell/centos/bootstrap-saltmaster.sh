#!/bin/bash

echo '### SALTMASTER SETUP'

mkdir /data/salt

ln -sf /data/salt /srv/salt

yum install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm -y

yum install -y salt-master salt-minion git

systemctl enable salt-master salt-minion
systemctl start salt-master salt-minion

echo 'auto_accept: True
file_roots:
  base:
    - /srv/salt/states
pillar_roots:
  base:
    - /srv/salt/pillars     
default_top: base
state_top_saltenv: base
top_file_merging_strategy: same
' > /etc/salt/master.d/master.conf

systemctl restart salt-master

yum install -y epel-release

yum install python-pygit2 -y

salt-run winrepo.genrepo
salt-run winrepo.update_git_repos

# salt -G 'os:Windows' pkg.refresh_db