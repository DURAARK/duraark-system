#!/bin/bash

echo "docker-compose -f devenv-compose.yml build && docker-compose -f devenv-compose.yml up"
docker-compose -f devenv-compose.yml build && docker-compose -f devenv-compose.yml up
