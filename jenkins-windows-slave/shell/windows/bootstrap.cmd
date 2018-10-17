echo "salt step"

echo "#grains:
  roles:
    - misprofile1" > C:\salt\conf\minion.d\minion.conf
    
salt-call pkg.refresh_db
salt-call --local chocolatey.install jdk8
salt-call --local chocolatey.install vscode