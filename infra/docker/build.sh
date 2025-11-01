
#!/bin/bash

cd ../../
docker build -f infra/docker/dockerfile -t hello-app .
