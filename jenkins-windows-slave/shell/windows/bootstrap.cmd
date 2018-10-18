echo "salt bootstrap start"

git clone -b issue-1 https://github.com/ministryofjustice/hmpps-mis-saltstack-pillars.git c:\salt\pillars

git clone -b issue-1 https://github.com/ministryofjustice/hmpps-mis-saltstack-states.git c:\salt\states

salt-call pkg.refresh_db && salt-call state.highstate

echo "salt bootstrap end"