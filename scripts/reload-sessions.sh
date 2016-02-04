#!/bin/bash

echo "sudo rm -rf ./duraark-sessions/.tmp"
echo "docker-compose -f docker-compose-dev.yml stop duraark-sessions && docker-compose -f docker-compose-dev.yml rm -f duraark-sessions"
echo "docker-compose -f docker-compose-dev.yml up -d"
echo "docker-compose -f docker-compose-dev.yml logs duraark-sessions"
sudo rm -rf ./duraark-sessions/.tmp && docker-compose -f docker-compose-dev.yml stop duraark-sessions && docker-compose -f docker-compose-dev.yml rm -f duraark-sessions && docker-compose -f docker-compose-dev.yml up -d && docker-compose -f docker-compose-dev.yml logs duraark-sessions
