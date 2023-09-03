sudo apt update 

# Install Docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
# Install Docker Compose
sudo apt install -y docker-compose

bash server-config.sh