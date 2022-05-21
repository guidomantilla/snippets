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
	apt-utils gnupg-agent apt-transport-https ca-certificates software-properties-common \
	git curl wget gnupg lsb-release gnome-tweaks vlc ubuntu-restricted-extras libqt5webkit5 \
	rar unrar p7zip-full p7zip-rar \
	nano htop zsh fuse direnv make jq build-essential protobuf-compiler virtualbox \
	-y
echo ""
echo ""
echo "**************************************************"
echo "***       INSTALLING:                          ***"
echo "***       - java, python and others            ***"
echo "**************************************************"
sudo apt-get install \
	python3 python3-pip openjdk-17-jdk \
	-y

wget https://go.dev/dl/go1.18.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz
sudo rm go1.18.2.linux-amd64.tar.gz

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
nvm install 16.15.0
nvm use default

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
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin  -y

sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo ""
echo ""
echo "**************************************************"
echo "***       INSTALLING MINIKUBE & HELM           ***"
echo "**************************************************"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm -y

echo ""
echo ""
echo "**************************************************"
echo "***       INSTALLING HASHICORP TOOLS           ***"
echo "**************************************************"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install consul vault boundary nomad waypoint terraform packer -y
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

