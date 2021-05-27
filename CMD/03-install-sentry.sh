echo ""
echo ""
echo "**************************************************"
echo "***       DOWNLOADING SENTY                    ***"
echo "**************************************************"
cd Workspace
git clone https://github.com/getsentry/onpremise.git
cd onpremise
git checkout releases/20.10.1
git pull 
echo ""
echo ""
echo "**************************************************"
echo "***       INSTALLING SENTY                     ***"
echo "**************************************************"
./install.sh --no-user-prompt
