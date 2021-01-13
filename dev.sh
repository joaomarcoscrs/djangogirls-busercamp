HOST=joaomarcos.busercamp.com.br

function devhelp() {
  echo "dkbuild             contrói a imagem docker"
  echo "dkrun               roda o projeto dockerizado"
  echo "deploy              sincroniza os arquivos do projeto com o servidor"
}

function dkbuild() {
  docker build -t joaomarcos .
}

function dkrun() {
  docker run -it -p 8001:8000 \
   -e DATABASE_FILE=/dkdata/db.sqlite3 \
   -e DJANGO_STATIC_ROOT=/dkdata/static \
   -v $(pwd)/dkdata:/dkdata \
   joaomarcos start.sh
}

function deploy() {
  rsync -av --exclude dkdata --exclude db.sqlite3 \
  ./* ubuntu@$HOST:./joaomarcos/
  ssh ubuntu@$HOST "cd joaomarcos && ./dkrunprod.sh"
}

devhelp