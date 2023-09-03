cd ~

sudo apt-get update
sudo apt-get install '^libssl1.0.[0-9]$' libunwind8 wget -y
wget https://github.com/PowerShell/PowerShell/releases/download/v7.3.6/powershell-7.3.6-linux-arm64.tar.gz
mkdir /usr/local/powershell
tar -xvf ./powershell-7.3.6-linux-arm64.tar.gz -C /usr/local/powershell
sudo ln -s /usr/local/powershell/pwsh /usr/bin/pwsh
rm ./powershell-7.3.6-linux-arm64.tar.gz