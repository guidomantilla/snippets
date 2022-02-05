echo "**************************************************"
echo "***       UPDATING PACKAGES REPOSITORIES       ***"
echo "**************************************************"
sudo apt-get update
echo ""
echo ""
echo "**************************************************"
echo "***       INSTALLING:                          ***"
echo "***       - git, curl, nano, htop              ***"
echo "***       - others                             ***"
echo "**************************************************"
sudo apt-get install \
	apt-utils \
	gnupg-agent \
	apt-transport-https \
	ca-certificates \
	software-properties-common \
	git \
	curl \
	gnupg \
    lsb-release \
	nano \
	htop \
	zsh \
	fuse \
	direnv \
	make \
	build-essential \
	python3 \
	python3-pip -y
echo ""
echo ""
echo "**************************************************"
echo "***       INSTALLING DOCKER                    ***"
echo "**************************************************"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
echo ""
echo ""
echo "**************************************************"
echo "***       INSTALLING DOCKER COMPOSE            ***"
echo "**************************************************"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo ""
echo ""
echo "**************************************************"
echo "***       CREATING WORKSPACE FOLDER            ***"
echo "**************************************************"
mkdir Workspace
#sudo chmod -R 777 Workspace
echo ""
echo ""
echo "**************************************************"
echo "***       DOCKER VERSION                       ***"
echo "**************************************************"
docker version
echo ""
echo ""
echo "**************************************************"
echo "***       DOCKER COMPOSE VERSION               ***"
echo "**************************************************"
docker-compose version
echo ""
echo ""
echo "**************************************************"
echo "***       GIT VERSION                          ***"
echo "**************************************************"
git version
echo ""
echo ""
echo "**************************************************"
echo "***       REBOOTING NOW                        ***"
echo "**************************************************"
sudo timedatectl set-timezone America/Bogota
history -c
sleep 10
sudo reboot now

