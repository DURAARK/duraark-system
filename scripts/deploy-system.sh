#!/bin/bash

echo "docker-compose pull && docker-compose up -d"
#docker-compose pull && docker-compose up -d

# FIXXME: workaround to circumvent issue with pulling 'duraark/workbench-ui'"
docker pull duraark/duraark-sessions
docker pull duraark/duraark-metadata
docker pull duraark/duraark-geometricenrichment
docker pull duraark/duraark-sda
docker pull duraark/duraark-digitalpreservation
docker pull duraark/duraark-pointcloud-viewer
docker pull duraark/api-gatekeeper

docker build -t duraark/workbench-ui:latest ./workbench-ui

docker-compose up -d
