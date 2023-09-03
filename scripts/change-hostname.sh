#!/bin/bash
echo "Enter New Hostname"
read varHostname

echo "$varHostname" | sudo tee /etc/hostname
echo 127.0.0.1 "$varHostname" | sudo tee /etc/hosts -a

bash server-config.sh