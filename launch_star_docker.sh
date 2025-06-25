#!/usr/bin/env bash

IMAGE_NAME="mgibio/star:2.7.0f"

docker run --rm -it \
    --name star-aligner \
    -v ${PWD}/johnson_alignments/:/app/ \
    -w /app \
    ${IMAGE_NAME}
