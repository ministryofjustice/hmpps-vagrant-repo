echo *****************STARTING WINDOWS PREP ****************

echo *****************Executing main script ****************

@powershell -NoProfile -ExecutionPolicy Bypass -File "%systemdrive%\vagrant\shell\windows\InstallChocolatey.ps1"

refreshenv

REM java -jar c:\jenkins\swarm-client.jar -master http://10.168.253.54:8080 -username admin -password admin -name jenkins-swarm-windows-slave-1

cd c:\salt

salt-call --local chocolatey.install git.install

echo "*****************WINDOWS VM PREP COMPLETE****************"
