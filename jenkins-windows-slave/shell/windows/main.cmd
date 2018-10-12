echo *****************STARTING WINDOWS PREP ****************

echo *****************Executing main script ****************

@powershell -NoProfile -ExecutionPolicy Bypass -File "%systemdrive%\vagrant\shell\windows\InstallChocolatey.ps1"

refreshenv

echo *** Installing ansible ***
pip install ansible

echo "*****************WINDOWS VM PREP COMPLETE****************"
