#!/bin/bash

echo "docker run --rm --name duraark-system -v /var/run/docker.sock:/var/run/docker.sock local/duraark-system"
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock --name duraark-system local/duraark-system
