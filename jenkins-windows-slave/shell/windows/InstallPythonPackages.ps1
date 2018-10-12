$ChocoInstallPath = "$env:SystemDrive\ProgramData\Chocolatey\bin"

#---- TEMPORARY ---
Disable-UAC

#--- Python ---
pip install ansible

#--- Restore Temporary Settings ---
Enable-UAC