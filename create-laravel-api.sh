#!/bin/bash

echo "Digite o nome do projeto?"
read projeto

docker run  \
-v "$(pwd)"/:/app \
-u $(id -u ${USER}):$(id -g ${USER}) \
composer \
bash -c "echo \$(id -u \${USER}):\$(id -g \${USER}) && composer create-project --prefer-dist specialtactics/laravel-api-boilerplate '$projeto';"
