echo "salt bootstrap start"

rmdir /s /q c:\salt\states

git clone -b issue-1 https://github.com/ministryofjustice/hmpps-mis-saltstack-states.git c:\salt\states

copy c:\salt\states\bootstrap\minion.conf C:\salt\conf\minion.d\minion.conf 

rmdir /s /q c:\salt\states

net stop salt-minion

net start salt-minion

salt-call pkg.refresh_db

salt-call state.highstate

echo "salt bootstrap end"