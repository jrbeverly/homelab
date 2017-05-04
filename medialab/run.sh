docker pull linuxserver/sonarr

#create user with PUID
#create group for user PGID
# Docker-compose is necessary

sudo docker create --name=sonarr \
	--restart=always \
	-p 8989:8989 \
	-e PUID=1001 -e PGID=1001 \
	-v /dev/rtc:/dev/rtc:ro \
	-v /home/docker/sonarr/config:/config \
	-v /home/docker/sonarr/tv:/tv \
	-v /home/docker/sonarr/downloads:/downloads \
	linuxserver/sonarr
