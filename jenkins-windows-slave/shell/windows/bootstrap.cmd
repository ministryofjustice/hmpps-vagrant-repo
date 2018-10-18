echo "salt bootstrap start"

rmdir /s /q c:\salt\pillars

rmdir /s /q c:\salt\states

git clone -b issue-1 https://github.com/ministryofjustice/hmpps-mis-saltstack-pillars.git c:\salt\pillars

git clone -b issue-1 https://github.com/ministryofjustice/hmpps-mis-saltstack-states.git c:\salt\states

copy c:\salt\states\bootstrap\fileroots.conf C:\salt\conf\minion.d\fileroots.conf

net stop salt-minion

net start salt-minion

salt-call --local state.highstate

echo "salt bootstrap end"