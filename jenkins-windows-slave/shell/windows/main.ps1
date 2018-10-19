$ChocoInstallPath = "$env:SystemDrive\ProgramData\Chocolatey\bin"

if (!(Test-Path $ChocoInstallPath)) {
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Host entry
Add-Content -Path C:\Windows\System32\Drivers\etc\hosts -Value "172.26.243.12 salt"

#---- TEMPORARY ---
Disable-UAC

#--- Python ---
choco install python -y

#--- awscli ---
choco install awscli -y

refreshenv

#--- Salt Minion ----
choco install saltminion -y

#--- Git ----
choco install git -y

#--- jdk ----
choco install jdk8 -y

#--- Visual C++ ----

choco install vcredist2012 -y

refreshenv

Enable-UAC