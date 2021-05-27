docker container rm -f $(docker container ls -a --format  "{{.Names}}")
docker image rm $(docker image ls --format  "{{.Repository}}:{{.Tag}}")
docker system prune -f
docker volume prune -f
