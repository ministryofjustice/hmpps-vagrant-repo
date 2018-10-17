echo "salt bootstrap start"

echo "grains:" > C:\salt\conf\minion.d\minion.conf
echo "  roles:" >> C:\salt\conf\minion.d\minion.conf
echo "    - misprofile1" >> C:\salt\conf\minion.d\minion.conf

salt-call pkg.refresh_db && salt-call --local chocolatey.install jdk8 && salt-call --local chocolatey.install vscode

echo "salt bootstrap end"