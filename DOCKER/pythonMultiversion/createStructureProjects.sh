#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: se deben proporcionar dos parámetros: el nombre del proyecto y la ruta donde se creará."
    exit 1
fi

PROJECT_NAME=$1
PROJECT_PATH=$2/$PROJECT_NAME

mkdir -p $PROJECT_PATH/config
touch $PROJECT_PATH/config/settings.py
echo "# Default settings file" > $PROJECT_PATH/config/settings.py
touch $PROJECT_PATH/config/local_settings.py
echo "# Local settings file" > $PROJECT_PATH/config/local_settings.py
touch $PROJECT_PATH/config/staging_settings.py
echo "# Staging settings file" > $PROJECT_PATH/config/staging_settings.py
touch $PROJECT_PATH/config/production_settings.py
echo "# Production settings file" > $PROJECT_PATH/config/production_settings.py

mkdir -p $PROJECT_PATH/docs/source
mkdir -p $PROJECT_PATH/docs/build
touch $PROJECT_PATH/docs/Makefile
echo "# Makefile for Sphinx documentation" > $PROJECT_PATH/docs/Makefile

mkdir -p $PROJECT_PATH/src/app/templates
mkdir -p $PROJECT_PATH/src/app/static
touch $PROJECT_PATH/src/__init__.py
touch $PROJECT_PATH/src/app/__init__.py
touch $PROJECT_PATH/src/app/models.py
touch $PROJECT_PATH/src/app/views.py

mkdir -p $PROJECT_PATH/src/tests
touch $PROJECT_PATH/src/tests/__init__.py
touch $PROJECT_PATH/src/tests/test_app.py

mkdir -p $PROJECT_PATH/requirements
touch $PROJECT_PATH/requirements/base.txt
touch $PROJECT_PATH/requirements/local.txt
touch $PROJECT_PATH/requirements/staging.txt
touch $PROJECT_PATH/requirements/production.txt

mkdir -p $PROJECT_PATH/scripts
touch $PROJECT_PATH/scripts/setup.sh
touch $PROJECT_PATH/scripts/run.py
echo "# script for exec the code" > $PROJECT_PATH/scripts/run.py

touch $PROJECT_PATH/.gitignore
touch $PROJECT_PATH/LICENSE
touch $PROJECT_PATH/README.md

chmod 777 -R $PROJECT_PATH