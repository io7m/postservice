#!/bin/sh -ex

rm -rfv out
mkdir -p out

VERSION=$(head -n 1 version.txt)
VERSION_ALPINE=$(head -n 1 version_alpine.txt)

exec podman build \
--format docker \
--build-arg "version=${VERSION}" \
--build-arg "version_alpine=${VERSION_ALPINE}" \
--iidfile out/image-id.txt \
-t "io7m/postservice:${VERSION}" .
