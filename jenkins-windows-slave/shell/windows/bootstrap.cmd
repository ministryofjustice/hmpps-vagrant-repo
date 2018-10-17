echo "salt step"
salt-run winrepo.update_git_repos
salt-call --local chocolatey.install jdk8.install
salt-call --local chocolatey.install vscode.install