#!/bin/bash
# 
#
#

# Do not split them up, force them to do the following

#
# SETUP FOR CONTAINER
#
# Pull image
# Get GID & UID from image
# Create UID/GID locally
# Add to global media lab repository
# Create OWNED directories (chown by user:group)

#
# Container Configuration
#
addgroup -S docker-media-lab
DUID=0
DGID=0

# Sonarr
#
# Configuring the sonarr environment
docker pull jrbeverly/sonarr:latest
DUID=$(docker inspect -f '{{ index .Config.Labels "io.gitlab.jrbeverly.user" }}' jrbeverly/sonarr:latest)
DGID=$(docker inspect -f '{{ index .Config.Labels "io.gitlab.jrbeverly.group" }}' jrbeverly/sonarr:latest)

addgroup -g ${DGID} -S docker-sonarr
adduser -S -G docker-deluge -u ${DUID} docker-sonarr
adduser docker-sonarr docker-media-lab

mkdir -p /srv/sonarr/
chown -R docker-sonarr:docker-sonarr /srv/sonarr/

mkdir -p /srv/downloads/ /srv/media/television/
chown -R :docker-media-lab /srv/downloads/ /srv/media/television/

# Deluge
#
# Configuring the deluge environment
docker pull jrbeverly/deluge:latest
DUID=$(docker inspect -f '{{ index .Config.Labels "io.gitlab.jrbeverly.user" }}' jrbeverly/deluge:latest)
DGID=$(docker inspect -f '{{ index .Config.Labels "io.gitlab.jrbeverly.group" }}' jrbeverly/deluge:latest)

addgroup -g ${DGID} -S docker-deluge
adduser -S -G docker-deluge -u ${DUID} docker-deluge
adduser docker-deluge docker-media-lab

mkdir -p /srv/deluge/ # other variables here
chown -R docker-deluge:docker-deluge /srv/deluge/

mkdir -p /srv/downloads/
chown -R :docker-media-lab /srv/downloads/
