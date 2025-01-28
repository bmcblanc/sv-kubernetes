#!/bin/bash
BASH_SOURCE_DIR="${BASH_SOURCE[0]%/*}"
export BASH_SOURCE_DIR="$(readlink -f ${BASH_SOURCE_DIR:-.})"

docker rm -f sv-kubernetes
docker build -t sv-kubernetes:${1:-latest} ${BASH_SOURCE_DIR}/..
docker run -d \
	--restart always \
	--name sv-kubernetes \
	--network host \
	-v ~/.kube/config:/.kube/config \
	-v ~/.ssh/github_key:/root/.ssh/github_key:ro \
	-v /Users/Shared/sv-kubernetes:/sv \
	-v /var/run/docker.sock:/var/run/docker.sock \
	sv-kubernetes:${1:-latest}

docker exec -it sv-kubernetes gcloud auth login --update-adc --no-launch-browser
