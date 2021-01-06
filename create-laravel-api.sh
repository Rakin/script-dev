#!/bin/bash

echo "Digite o nome do projeto?"
read projeto

docker run  \
-v "$(pwd)"/:/app \
-u $(id -u ${USER}):$(id -g ${USER}) \
composer \
bash -c "echo \$(id -u \${USER}):\$(id -g \${USER}) && composer create-project --prefer-dist laravel/laravel '$projeto';"

bash -c "echo \$(id -u \${USER}):\$(id -g \${USER}) && composer create-project --prefer-dist laravel/laravel '$projeto';"

cd "$projeto"
git init
git add .
git commit -m "Instalacao laravel"

git submodule add git@github.com:desize/.devcontainer.git
git init
git add .
git commit -m "Instalacao .devcontainer"

code .
