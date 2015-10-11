#!/bin/bash

echo "docker-compose pull && docker-compose up -d"
git pull
git submodule foreach checkout master
git submodule foreach pull master
docker-compose -f devenv-compose.yml build && docker-compose -f devenv-compose.yml up
