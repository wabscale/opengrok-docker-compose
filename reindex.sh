#!/bin/sh

#if ! docker-compose ps | grep 'Up' &> /dev/null; then
#    echo
#    echo '  start the opengrok container plz'
#    echo
#fi

docker-compose -f ../docker-compose.yml exec opengrok /scripts/index.sh
