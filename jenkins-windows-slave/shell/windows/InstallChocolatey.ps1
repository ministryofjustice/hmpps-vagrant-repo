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

#--- Curl ---
choco install curl -y

#--- Chrome ---
choco install googlechrome -y

#--- Create jenkins dir
New-Item -Path c:\jenkins\workspace -ItemType directory

powershell -command "& { iwr https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.14/swarm-client-3.14.jar -OutFile c:\jenkins\swarm-client.jar }"

#--- Restore Temporary Settings ---
Enable-UAC