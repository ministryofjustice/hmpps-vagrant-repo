echo "salt step"
salt-call pkg.refresh_db
salt-call --local chocolatey.install jdk8
salt-call --local chocolatey.install vscode