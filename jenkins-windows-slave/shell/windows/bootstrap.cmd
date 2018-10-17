echo "salt bootstrap start"

salt-call pkg.refresh_db && salt-call --local chocolatey.install vscode

echo "salt bootstrap end"