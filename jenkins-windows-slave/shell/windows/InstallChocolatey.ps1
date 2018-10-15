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

#--- Create jenkins dir
New-Item -Path c:\jenkins\workspace -ItemType directory

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
wget -OutFile c:\jenkins\swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.14/swarm-client-3.14.jar

#--- Restore Temporary Settings ---
Enable-UAC