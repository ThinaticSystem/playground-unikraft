#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

log_info() {
	message=$1

	echo "[INFO] $message"
}
log_error() {
	message=$1

	echo "[ERROR] $message" \
	>&2
}

log_info 'Installing & Launching buildkit...'
CONTAINER_BUILDKIT_NAME=buildkitd
docker start "$CONTAINER_BUILDKIT_NAME" \
|| docker run \
	--detach \
	--privileged \
	--name "$CONTAINER_BUILDKIT_NAME" \
	moby/buildkit:v0.34.2
KRAFTKIT_CONFIG_DIR=~/.config/kraftkit
mkdir --parents "$KRAFTKIT_CONFIG_DIR"
echo "buildkit_host: docker-container://$CONTAINER_BUILDKIT_NAME" \
>> "$KRAFTKIT_CONFIG_DIR/config.yaml"

sudo chmod 666 /dev/kvm

log_info 'postCreateCommand completed.'
