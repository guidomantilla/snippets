echo ""
echo ""
echo "**************************************************"
echo "***       DOWNLOADING SENTY                    ***"
echo "**************************************************"
cd Workspace
git clone https://github.com/getsentry/onpremise.git
echo ""
echo ""
echo "**************************************************"
echo "***       INSTALLING SENTY                     ***"
echo "**************************************************"
./install.sh --no-user-prompt

docker compose up -d
docker compose run --rm web createuser
