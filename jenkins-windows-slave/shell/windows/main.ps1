$ChocoInstallPath = "$env:SystemDrive\ProgramData\Chocolatey\bin"

if (!(Test-Path $ChocoInstallPath)) {
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Host entry
Add-Content -Path C:\Windows\System32\Drivers\etc\hosts -Value "172.26.243.12 salt"

#---- TEMPORARY ---
Disable-UAC

#--- Python ---
choco install python2 -y

#--- awscli ---
choco install awscli -y

refreshenv

#--- Salt Minion ----
choco install saltminion -y

#--- Git ----
choco install git -y

refreshenv

Add-Content -Path C:\salt\conf\minion.d\minion.conf -Value "grains:"
Add-Content -Path C:\salt\conf\minion.d\minion.conf -Value "  roles:"
Add-Content -Path C:\salt\conf\minion.d\minion.conf -Value "    - misprofile1"

# #--- Bootstrap ----

# Set-Location -Path C:\salt

# start-process -filepath C:\vagrant\shell\windows\bootstrap.cmd

#--- Restore Temporary Settings ---
Enable-UAC

# java -jar c:\jenkins\swarm-client.jar -master http://10.168.253.54:8080 -username admin -password admin -name jenkins-swarm-windows-slave-1