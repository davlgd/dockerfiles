#!/bin/bash

SSH_KEY_PATH='/home/david/.ssh/id_ed25519.pub'

docker build --build-arg SSH_PUBLIC_KEY="$(cat $SSH_KEY_PATH)" -t archy -f src/archy .
docker run -d --name archy -h archdock -p 2121:22 archy

docker build --build-arg SSH_PUBLIC_KEY="$(cat $SSH_KEY_PATH)" -t clever -f src/nodejs .
docker run --name clevy -d -v ~/.config/clever-cloud/clever-tools.json:/home/davlgd/.config/clever-cloud/clever-tools.json:ro -h cleverdock -p 2142:22 clever

docker system prune -af
docker ps
