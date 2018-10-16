$ChocoInstallPath = "$env:SystemDrive\ProgramData\Chocolatey\bin"

if (!(Test-Path $ChocoInstallPath)) {
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

#---- TEMPORARY ---
Disable-UAC

#--- Python ---
choco install python2 -y

#--- awscli ---
choco install awscli -y

refreshenv

#--- Salt Minion ----
choco install saltminion -y

refreshenv

Set-Location -Path c:\salt

Start-Process "cmd.exe" "/c salt-call --local chocolatey.install git.install"  -Verb runAs

#--- Restore Temporary Settings ---
Enable-UAC

# java -jar c:\jenkins\swarm-client.jar -master http://10.168.253.54:8080 -username admin -password admin -name jenkins-swarm-windows-slave-1