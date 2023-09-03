#!/bin/bash
clear
varArch=$(uname -m)

echo -n "
Ubuntu Server Config is a set of scripts to help configure and manage Ubuntu Server 20.04

1. Install PowerShell
2. Change Hostname (Reboot Required)
3. Assign Static IP Address (PowerShell Required)
4. Install Docker
5. Install Terraform
6. Import SSH Key(s) from Github (PowerShell Required)
7. Install Cockpit Webgui https://<ip address>:9090
8. Reboot

9. Refresh Ubuntu Server Config
10. Quit

Enter selection:"
read varSelection

if [[ $varSelection -eq 1 ]]
then
    if [[ $varArch == x86_64 ]]
    then
    echo Installing PowerShell for $varArch
    bash scripts/install-powershell.sh
    fi

    if [[ $varArch == aarch64 ]]
    then
    echo Installing PowerShell for $varArch
    bash scripts/install-powershell-arm.sh
    fi
fi

if [[ $varSelection -eq 2 ]]
then
bash scripts/change-hostname.sh
fi

if [[ $varSelection -eq 3 ]]
then
pwsh scripts/change-ip.ps1
fi

if [[ $varSelection -eq 4 ]]
then
bash scripts/install-docker.sh
fi

if [[ $varSelection -eq 5 ]]
then
bash scripts/install-terraform.sh
fi

if [[ $varSelection -eq 6 ]]
then
pwsh scripts/import-github-ssh-key.ps1
fi

if [[ $varSelection -eq 7 ]]
then
sudo apt-get update && sudo apt-get install cockpit -y
fi

if [[ $varSelection -eq 8 ]]
then
sudo shutdown -r now
fi


if [[ $varSelection -eq 9 ]]
then
git pull
clear
fi

if [[ $varSelection -eq 10 ]]
then
echo " "
fi
