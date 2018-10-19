#!/bin/bash

echo '### SALTMASTER SETUP'

yum install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm -y

yum install -y salt-master salt-minion git

systemctl enable salt-master salt-minion
systemctl start salt-master salt-minion

echo 'auto_accept: True
default_top: base
state_top_saltenv: base
top_file_merging_strategy: same

fileserver_backend:
  - gitfs

gitfs_base: develop
gitfs_remotes:
  - https://github.com/ministryofjustice/hmpps-mis-saltstack-states.git

git_pillar_base: develop
ext_pillar:
  - git:
    - develop https://github.com/ministryofjustice/hmpps-mis-saltstack-pillars.git
' > /etc/salt/master.d/master.conf

systemctl restart salt-master

yum install -y epel-release

yum install python-pygit2 -y

salt-run winrepo.genrepo
salt-run winrepo.update_git_repos

# salt -G 'os:Windows' pkg.refresh_db