echo "salt step"
cd c::\salt
salt-call --local chocolatey.install jdk8.install
salt-call --local chocolatey.install vscode.install