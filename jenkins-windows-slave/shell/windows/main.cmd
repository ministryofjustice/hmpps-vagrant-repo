echo *****************STARTING WINDOWS PREP ****************

echo *****************Executing main script ****************

@powershell -NoProfile -ExecutionPolicy Bypass -File "%systemdrive%\vagrant\shell\windows\InstallChocolatey.ps1"

refreshenv

echo *** Installing jenkins swarm plugin ***
mkdir c:\jenkins\workspace
cd c:\jenkins
curl -OL https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.14/swarm-client-3.14.jar -o swarm-client.jar

REM java -jar c:\jenkins\swarm-client.jar -master http://10.168.253.54:8080 -username admin -password admin -name jenkins-swarm-windows-slave-1

echo "*****************WINDOWS VM PREP COMPLETE****************"
