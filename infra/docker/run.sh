
#!/bin/bash

if [ $(docker ps -aq -f name=hello-app) ]; then
    echo "Removing existing container..."
    docker rm -f hello-app
fi

docker run -d -p 80:80 --name hello-app hello-app
