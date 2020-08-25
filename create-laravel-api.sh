#!/bin/bash

echo "Digite o nome do projeto?"
read projeto

docker run  \
-v "$(pwd)"/:/app \
-u $(id -u ${USER}):$(id -g ${USER}) \
composer \
bash -c "echo \$(id -u \${USER}):\$(id -g \${USER});" \
"create-project --prefer-dist specialtactics/laravel-api-boilerplate $projeto;"

chown -R developer:developer ./

cd "$projeto"

sed -ri -e 's!DB_CONNECTION=pgsql!DB_CONNECTION=mysql!g' ./.env
sed -ri -e 's!DB_PORT=5432!DB_PORT=3306!g' ./.env
sed -ri -e 's!DB_DATABASE=your_project_local!DB_DATABASE='$projeto'!g' ./.env
sed -ri -e 's!DB_USERNAME=laradock!DB_USERNAME=root!g' ./.env

git init \
  && git submodule add -f https://github.com/desize/.devcontainer.git \
  && git add . \
  && git commit -m "First commit"

code .


