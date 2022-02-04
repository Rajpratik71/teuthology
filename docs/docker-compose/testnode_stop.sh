#!/usr/bin/bash
set -x
payload="{\"name\": \"$(hostname)\", \"machine_type\": \"testnode\", \"up\": false}"
for i in $(seq 1 5); do
    echo "attempt $i"
    curl -v -f -d "$payload" http://paddles:8080/nodes/ && break
    sleep 1
done
pkill sshd