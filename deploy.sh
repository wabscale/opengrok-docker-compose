#!/bin/bash

cd $(dirname $(realpath $0))

check_deps() {
    local DIRS
    DIRS=(
        .data/opengrok-src
        .data/opengrok-etc
        .data/opengrok-data
    )

    for i in "${DIRS[@]}"; do
        mkdir -p ${i};
    done

    if ! docker network ls | grep 'traefik-proxy' &> /dev/null; then
        docker network create traefik-proxy
    fi
}

bring_up_service() {
    docker-compose up -d --force-recreate
}

main() {
    check_deps
    bring_up_service
}

main
