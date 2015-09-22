#!/bin/bash
docker-machine -D create -d generic \
--generic-ssh-user root \
--generic-ssh-key ~/.ssh/id_rsa-larissa \
--generic-ip-address 129.27.218.55 \
mimas
