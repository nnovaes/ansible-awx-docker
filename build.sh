#!/bin/sh
export DOCKERTAG=normannovaes/ansible-awx-docker
docker build -t normannovaes/awx-operator-builder -f ./awx-operator-builder.Dockerfile
docker run -itd --name awx-operator-build -v /var/run/docker.sock:/var/run/docker.sock normannovaes/awx-operator-builder
docker exec awx-operator-build make docker-compose-build
docker image tag $(docker images --format "{{json . }}" | grep quay | jq -r ".ID") ${DOCKERTAG}
docker push ${DOCKERTAG}
#docker inspect $(docker images --format "{{json . }}" | grep quay | jq -r ".ID") | jq -r ".[].RootFS.Layers[]"