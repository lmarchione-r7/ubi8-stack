# Requires `docker login` in order to push image to registry

set -x

docker run -d --rm --privileged tonistiigi/binfmt --install all
docker context create al2-stack-context
docker buildx create --name al2-stack --use al2-stack-context
docker buildx ls
docker buildx bake --file docker-bake.hcl --push
