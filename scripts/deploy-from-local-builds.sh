#!/bin/bash

echo "git pull && git submodule foreach git checkout master && git submodule foreach git pull"
git pull && git submodule foreach git checkout master && git submodule foreach git pull

echo "(cd ./microservice-base && ./scripts/docker-build.sh)"
(cd ./microservice-base && ./scripts/docker-build.sh)

echo "docker-compose -f docker-compose-prod.yml build && docker-compose -f docker-compose-prod.yml up"
docker-compose -f docker-compose-prod.yml build && docker-compose -f docker-compose-prod.yml up -d
