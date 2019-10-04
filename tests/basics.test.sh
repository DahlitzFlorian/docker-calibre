#!/bin/sh

# Set repo name
REPO=floriandahlitz/docker-calibre

# Kill any running dynamodb containers.
echo "Cleaning up old containers..."
docker ps -a | grep $REPO | awk '{print $1}' | xargs docker rm -f  || true

# Run the container.
echo "Checking we can run the container..."
ID=$(docker container run -itd --rm $REPO)
sleep 2

# Check if Calibre CLI commands are available
echo "Check if Calibre CLI tools are available..."

RETURN_STRING="$(docker container exec $ID ebook-convert)"

case $RETURN_STRING in
    *"Convert an e-book from one format to another."*)
    echo "Calibre CLI tools are available."
    ;;
    *)
    echo "Calibre CLI tools NOT available."
    exit 1
    ;;
esac

# Clean up the container.
echo "Stopping..."
docker container stop $ID || true
