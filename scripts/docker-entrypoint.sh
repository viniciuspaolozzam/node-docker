#!/bin/bash

docker build -t expressjs-mongodb .
docker run -it --name node -p 49160:8080 -p 27017:27017 -d -v ~/workspace/project-x/node:/usr/src/app/ expressjs-mongodb