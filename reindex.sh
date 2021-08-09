#!/bin/sh

set -x

for i in $(find .data/opengrok-src -maxdepth 2 -name '.git' -type d); do
    cd $(dirname $i)
    git pull
    cd ../../../
done

docker-compose -f ../docker-compose.yml exec opengrok /scripts/index.sh
