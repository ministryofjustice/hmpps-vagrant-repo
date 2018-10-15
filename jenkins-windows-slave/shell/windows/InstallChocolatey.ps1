$ChocoInstallPath = "$env:SystemDrive\ProgramData\Chocolatey\bin"

if (!(Test-Path $ChocoInstallPath)) {
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

#---- TEMPORARY ---
Disable-UAC

#--- Python ---
choco install awscli -y

#--- JDK ---
choco install jdk8 -y

#--- Curl ---
choco install curl -y

#--- Chrome ---
choco install googlechrome -y

#--- Restore Temporary Settings ---
Enable-UAC