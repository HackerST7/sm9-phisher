#!/bin/bash

# I'm not that familiar with docker. Send a PR if something is wrong (^.^)

BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")
if [[ ! -d "$BASE_DIR/auth" ]]; then
    echo "Creating Auth Directory.."
	mkdir -p "$BASE_DIR/auth"
fi

CONTAINER="sm9-phisher"
IMAGE="HackerSM9/sm9-phisher:latest"
IMG_MIRROR="ghcr.io/HackerSM9/sm9-phisher:latest"
MOUNT_LOCATION=${BASE_DIR}/auth
check_container=$(docker ps --all --format "{{.Names}}")

if [[ ! $check_container == $CONTAINER ]]; then
	echo "Creating new container..."
	docker create \
		--interactive --tty \
		--volume ${MOUNT_LOCATION}:/sm9-phisher/auth/ \
		--network host \
		--name "${CONTAINER}" \
		"${IMAGE}"
fi

docker start --interactive "${CONTAINER}"

# docker run --rm -ti --network="host" -v ${MOUNT_LOCATION}:/sm9-phisher/auth/ --name "$CONTAINER" "$IMAGE"
