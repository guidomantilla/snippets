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
	nano \
	htop \
	zsh \
	python2 \
	python3 -y
echo ""
echo ""
echo "**************************************************"
echo "***       INSTALLING DOCKER                    ***"
echo "**************************************************"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world
#chown "$USER":"$USER" /home/"$USER"/.docker -R
#chmod g+rwx "$HOME/.docker" -R
echo ""
echo ""
echo "**************************************************"
echo "***       INSTALLING DOCKER COMPOSE            ***"
echo "**************************************************"
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo ""
echo ""
echo "**************************************************"
echo "***       CREATING WORKSPACE FOLDER            ***"
echo "**************************************************"
mkdir Workspace
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
history -c
sleep 10
sudo reboot now

