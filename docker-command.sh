#!/bin/bash
#docker run -it --rm --mount type=bind,source="$(pwd)"/setup-alpine.sh,target=/setup-alpine.sh,readonly -v "$(pwd)"/rootfs:/my-rootfs alpine
docker run -it --rm -v"$(pwd)/config:/config -v "$(pwd)"/rootfs:/my-rootfs alpine
