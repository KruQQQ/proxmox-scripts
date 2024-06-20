#!/bin/bash

generate_random_port() {
    while :; do
        PORT=$(shuf -i 1024-65535 -n 1)
        ss -lntu | grep -q ":$PORT " || break
    done
    echo $PORT
}

generate_random_port
