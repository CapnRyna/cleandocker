#!/bin/bash

# I recommend you alias this to use anywhere

function cleandocker() {
    read -p "Are you sure you want to continue? <y/N> " prompt # You can remove this check if needed.
    if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]; then
        echo "Proceeding with Docker cleanup..."
        docker system prune -a -f && docker rm -vf $(docker ps -aq) && docker rmi -f $(docker images -aq)
    else
        echo "Exiting without making any changes."
        exit 0
    fi
}
