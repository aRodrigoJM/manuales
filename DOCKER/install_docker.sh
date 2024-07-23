#!/bin/bash

# example: sudo sh install_docker.sh 

# Función para verificar si Docker está instalado
check_docker_installed() {
  if command -v docker &> /dev/null; then
    echo "Docker ya está instalado."
  else
    echo "Instalando Docker..."
    curl -sSL https://get.docker.com | sh
  fi
}

# Función para verificar si el grupo Docker existe
check_docker_group_exists() {
  if getent group docker > /dev/null 2>&1; then
    echo "El grupo 'docker' ya existe."
  else
    echo "Creando el grupo 'docker'..."
    sudo groupadd docker
  fi
}

# Función para verificar si el usuario pertenece al grupo Docker
check_user_in_docker_group() {
  if id -nG "$USER" | grep -qw docker; then
    echo "El usuario ya pertenece al grupo 'docker'."
  else
    echo "Añadiendo el usuario al grupo 'docker'..."
    sudo usermod -aG docker "$USER"
    newgrp docker
  fi
}

# Función para generar la URL de Docker Compose si no se proporciona
generate_docker_compose_url() {
  UNAME_S=$(uname -s)
  UNAME_M=$(uname -m)
  VERSION="v2.24.0-birthday.10"
  URL="https://github.com/docker/compose/releases/download/$VERSION/docker-compose-$UNAME_S-$UNAME_M"
  echo "$URL"
}

# Verificar e instalar Docker si es necesario
check_docker_installed

# Verificar si el grupo Docker existe y crearlo si es necesario
check_docker_group_exists

# Verificar si el usuario pertenece al grupo Docker y añadirlo si es necesario
check_user_in_docker_group

# Verificar si se ha proporcionado una URL como argumento
if [ -z "$1" ]; then
  echo "No se ha proporcionado una URL. Generando la URL de Docker Compose..."
  URL=$(generate_docker_compose_url)
else
  URL=$1
  echo "Usando la URL proporcionada: $URL"
fi

# Descargar Docker Compose
echo "Descargando Docker Compose desde $URL..."
sudo curl -L $URL -o /usr/local/bin/docker-compose

# Dar permisos de ejecución a Docker Compose
echo "Dando permisos de ejecución a Docker Compose..."
sudo chmod +x /usr/local/bin/docker-compose

# Verificar la instalación
echo "Verificando la instalación de Docker Compose..."
docker-compose --version

echo "Instalación de Docker Compose completada."
