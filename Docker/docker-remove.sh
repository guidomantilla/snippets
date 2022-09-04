docker container rm -f $(docker container ls -a --format  "{{.Names}}" | grep -v "sonarqube")
docker image rm $(docker image ls --format  "{{.Repository}}:{{.Tag}}")
docker system prune --force --all --volumes
