echo "salt bootstrap start"

salt-call pkg.refresh_db && salt-call state.highstate

echo "salt bootstrap end"