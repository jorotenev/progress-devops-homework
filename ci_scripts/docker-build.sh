set -e
if [ -z ${DOCKER_HUB_PASSWORD+x} ]; then echo "DOCKER_HUB_PASSWORD is unset"; fi
if [ -z ${DOCKER_HUB_USERNAME+x} ]; then echo "DOCKER_HUB_USERNAME is unset"; fi

image_name=progress-devops-homework
echo "logging to dockerhub"
echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin

echo 'building docker image $image_name'
docker build -t $image_name .

echo "tagging docker image $image_name"
docker tag $image_name  $DOCKER_HUB_USERNAME/$image_name:latest

echo "pushing to dockerhub $DOCKER_HUB_USERNAME/$image_name:latest"
docker push $DOCKER_HUB_USERNAME/$image_name:latest