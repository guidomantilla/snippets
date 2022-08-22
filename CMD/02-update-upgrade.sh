echo ""
echo ""
echo "**************************************************"
echo "***       UPDATING & UPGRADING                 ***"
echo "**************************************************"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get -y dist-upgrade && sudo apt autoremove -y
echo ""
echo ""
echo "**************************************************"
echo "***       REBOOTING NOW                        ***"
echo "**************************************************"
history -c
sleep 10
sudo reboot now

