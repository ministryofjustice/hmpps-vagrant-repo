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

# #--- Salt Minion ----
# choco install saltminion -y

#--- Git ----
choco install git -y

refreshenv

iwr https://repo.saltstack.com/windows/Salt-Minion-2018.3.2-Py3-x86-Setup.exe -OutFile c:\tmp\salt-minion.exe

Enable-UAC