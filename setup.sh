#!/bin/bash

INSTANCE="webdriver"
COMMAND=$1

build() {
    echo "[setup.sh] Building $INSTANCE image..."
    docker build -t $INSTANCE .
}

run() {
    echo "[setup.sh] Creating $INSTANCE container..."
    docker run \
        -d \
        --name $INSTANCE \
        -p 4444:4444 \
        $INSTANCE
}

dev() {
    stop && \
    echo "[setup.sh] Creating $INSTANCE container..."
    docker run \
        -it \
        --name $INSTANCE \
        -p 4444:4444 \
        $INSTANCE \
        /bin/bash
}

stop() {
    echo "[setup.sh] Stopping $INSTANCE container..."
    docker stop $INSTANCE && \
    echo "[setup.sh] Removing $INSTANCE container..."
    docker rm $INSTANCE
}

delete() {
    echo "[setup.sh] Deleting $INSTANCE image..."
    docker rmi -f $INSTANCE
}

usage() {
    echo "Usages:"
    echo "$ sh setup.sh build"
    echo "$ sh setup.sh run"
    echo "$ sh setup.sh stop"
    echo "$ sh setup.sh delete"
    echo "$ sh setup.sh dev"
}

if [ "$COMMAND" == "" ];then
    usage && \
    exit 1
else
    "$COMMAND" && \
    exit 0
fi
