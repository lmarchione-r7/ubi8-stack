# Requires `docker login` in order to push image to registry

set -x

docker run -d --rm --privileged tonistiigi/binfmt --install all
docker context create ubi8-stack-context
docker buildx create --name ubi8-stack --use ubi8-stack-context
docker buildx ls
docker buildx bake --file docker-bake.hcl --push
