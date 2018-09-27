#/bin/sh
docker run --name dev-nginx --rm -e VIRTUAL_HOST="test.jrbeverly.me" -p 1080:80 -v $(pwd):/usr/share/nginx/html:ro nginx