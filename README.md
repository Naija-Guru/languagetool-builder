# LanguageTool Builder
Build/deployment configs and docs for [Naija Guru's LanguageTool fork](https://github.com/Naija-Guru/languagetool).

## Installation
- Install Docker - https://docs.docker.com/engine/install/
    
    For Ubuntu:
    ```sh
    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Linux post-installation steps for Docker Engine
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    ```
- Copy Docker Compose template in repo to the server and edit as appropriate.
- Run `docker compose up -d`.

## Upgrade
- Run `docker compose down`.
- Clear old Traefik access logs.
    ```sh
    rm logs/traefik/old-access.log
    mv logs/traefik/access.log logs/traefik/old-access.log
    sudo service filebeat start
    ```
- Run `docker compose up -d`.
