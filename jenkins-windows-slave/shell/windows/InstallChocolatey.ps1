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

#--- JDK ---
choco install jdk8 -y

#--- wget ---
choco install wget -y

#--- Chrome ---
choco install googlechrome -y

#--- Salt Minion ----
choco install saltminion -y

#--- Create jenkins dir
New-Item -Path c:\jenkins\workspace -ItemType directory

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
wget -OutFile c:\jenkins\swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.14/swarm-client-3.14.jar

# #---- Add swarm service ---
# New-Service -Name "JenkinsSwarm" -BinaryPathName "java -jar c:\jenkins\swarm-client.jar -master http://10.168.253.54:8080 -username admin -password admin -name jenkins-swarm-windows-slave-1"
# Set-Service -Name "JenkinsSwarm" -StartupType Automatic
# Start-Service -Name "JenkinsSwarm"

#--- Restore Temporary Settings ---
Enable-UAC