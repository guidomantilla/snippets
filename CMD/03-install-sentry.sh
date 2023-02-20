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
./install.sh --skip-user-creation --no-report-self-hosted-issues

docker compose up -d
docker compose run --rm web createuser
