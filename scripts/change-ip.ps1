$CurrentDir = pwd
cd $PSScriptRoot

Read-Host '
Hit "ENTER" to get list of current ethernet adapters'
clear

Write-Host "Ethernet Adapters"
$IPs = ip address | select-string -Simplematch UP ; $IPs | foreach {($_ -Split ":\ <")[0] } | foreach {($_ -Split ":")[1] }

$EtherentAdapter = Read-Host "

Enter Ethernet Adapter (i.e., ens30, ens192, eth0)"
$IPAddress = Read-Host "Enter IP Address (i.e., 192.168.1.1/24)"
$Gateway = Read-Host "Enter Gatway IP Address (i.e., 192.168.1.1)"
$DNS = Read-Host "Enter DNS Address (i.e., 8.8.8.8)"

$Template = @"
network:
    ethernets:
        [EHTERETADAPTER]:
            addresses:
            - [IPADDRESSMASK]
            dhcp4: false
            gateway4: [GATEWAYADDRESS]
            nameservers:
                addresses:
                - [DNSADDRESS]
            optional: true
    version: 2
"@

#$Template

Read-Host '
Hit "ENTER" to Continue'
$Template = $Template.replace("[EHTERETADAPTER]","$EtherentAdapter")
$Template = $Template.replace("[IPADDRESSMASK]","$IPAddress")
$Template = $Template.replace("[GATEWAYADDRESS]","$Gateway")
$Template = $Template.replace("[DNSADDRESS]","$DNS")

sudo rm /etc/netplan/50-cloud-init.yaml
try {echo $Template | sudo tee /etc/netplan/00-cloud-init.yaml} catch {}
sudo shutdown -r now
#sudo netplan apply