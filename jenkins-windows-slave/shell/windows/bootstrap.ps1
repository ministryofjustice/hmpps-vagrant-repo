#---- TEMPORARY ---
Disable-UAC

refreshenv

Set-Location -Path c:\salt

Start-Process "cmd.exe" "/c salt-call --local chocolatey.install git.install"  -Verb runAs

#--- Restore Temporary Settings ---
Enable-UAC