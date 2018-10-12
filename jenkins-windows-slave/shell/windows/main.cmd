echo *****************STARTING WINDOWS PREP ****************

echo *****************Executing main script ****************

@powershell -NoProfile -ExecutionPolicy Bypass -File "%systemdrive%\vagrant\shell\windows\InstallChocolatey.ps1"

@powershell -NoProfile -ExecutionPolicy Bypass -File "%systemdrive%\vagrant\shell\windows\InstallPytonPackages.ps1"

echo "*****************WINDOWS VM PREP COMPLETE****************"
