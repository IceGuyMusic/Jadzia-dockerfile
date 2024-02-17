#!/bin/bash


while getopts ":t:" opt; do
  case $opt in
    t) TAG="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    exit 1
    ;;
  esac
done

# Check if TAG is provided
if [ -z "$TAG" ]; then
  echo "Tag is required. Use -t to specify the tag."
  exit 1
fi

# Define a function for error handling
error_handling() {
  if [ $? -ne 0 ]; then
    echo "An error occurred. Stopping the script."
    exit 1
  fi
}

# Build and push Docker images
docker build -t iceguy/jadzia-flask:$TAG -f jadzia/Dockerfile . && \
docker push iceguy/jadzia-flask:$TAG
error_handling

docker build -t iceguy/jadzia-celery:$TAG -f celery-worker/Dockerfile . && \
docker push iceguy/jadzia-celery:$TAG
error_handling

docker build -t iceguy/healthcheck:$TAG -f healtcheck/Dockerfile . && \
docker push iceguy/healthcheck:$TAG
error_handling

