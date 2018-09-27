#/bin/sh
docker run --name dev-nginx --rm -p 80:80 -v $(pwd):/usr/share/nginx/html:ro nginx