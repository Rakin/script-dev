#!/bin/bash

echo "Digite o nome do projeto?"
read projeto

docker run  \
-v "$(pwd)"/:/app \
-u $(id -u ${USER}):$(id -g ${USER}) \
composer \
bash -c "echo \$(id -u \${USER}):\$(id -g \${USER}) && composer create-project --prefer-dist specialtactics/laravel-api-boilerplate '$projeto';"

sed -ri -e 's!DB_CONNECTION=pgsql!DB_CONNECTION=mysql!g' "./$projeto/.env"
sed -ri -e 's!DB_PORT=5432!DB_PORT=3306!g' "./$projeto/.env"
sed -ri -e 's!DB_DATABASE=your_project_local!DB_DATABASE='"$projeto"'!g' "./$projeto/.env"
sed -ri -e 's!DB_USERNAME=laradock!DB_USERNAME=root!g' "./$projeto/.env"

