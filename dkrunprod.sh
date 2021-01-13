#1/bin/bash

docker build -t joaomarcos .
docker stop joaomarcos
docker run -d --rm -p 8001:8000 \
   --env-file $HOME/joaomarcos.env \
   --name joaomarcos \
   -v $(pwd)/dkdata:/dkdata \
   joaomarcos start.sh