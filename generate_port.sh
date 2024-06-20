#!/bin/bash

generate_random_port() {
    # Lista portów do pominięcia (używane przez system/usługi)
    used_ports=(22 80 443 8006 3000)  # Dodaj tutaj inne używane porty

    while :; do
        PORT=$(shuf -i 1024-65535 -n 1)
        if [[ ! " ${used_ports[@]} " =~ " ${PORT} " ]]; then
            ss -lntu | grep -q ":$PORT " || break
        fi
    done
    echo $PORT
}

generate_random_port
