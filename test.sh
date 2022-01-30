#!/bin/env bash
# Simple script that is made to make testing ansible easier using ./Dockerfile
# Some of the tasks cannot be executed on container since it requires more dependencies that the image doesn't have
# The real test is done on Regolith VM though

docker stop ansible
docker rm ansible
docker build . -t mrgeek/ansible
docker run --name ansible $@ -idt mrgeek/ansible
docker logs -f ansible
