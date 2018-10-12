#---- TEMPORARY ---
Disable-UAC

#--- Python ---
choco install python2 -y

# refresh environment vars
refreshenv

#--- Restore Temporary Settings ---
Enable-UAC