echo "Digite o nome do projeto?"
read projeto

docker run  \
-v "$(pwd)"/:/app \
-u $(id -u ${USER}):$(id -g ${USER}) \
node \
bash -c "echo \$(id -u \${USER}):\$(id -g \${USER}) && yarn create nuxt-app '$projeto'"