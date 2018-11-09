#!/bin/sh

localectl set-locale LANG=en_US.utf8
container_name=$(curl -s -XGET --unix-socket /var/run/docker.sock  -H "Content-Type: application/json" http://v1.24/containers/$(hostname)/json | jq -r .Name[1:])
echo ${container_name} > /etc/salt/minion_id
echo "export PS1=\"root@${container_name}(\\\$PWD)# \"" >> ~root/.bashrc

exec "$@"
