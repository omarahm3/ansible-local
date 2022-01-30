FROM ubuntu:focal AS base

WORKDIR /usr/local/bin

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential sudo software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS mrgeek

ARG TAGS

RUN addgroup --gid 1000 mrgeek
RUN adduser --gecos mrgeek --uid 1000 --gid 1000 --disabled-password mrgeek
RUN adduser mrgeek sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER mrgeek

WORKDIR /home/mrgeek

FROM mrgeek

COPY . .

RUN sudo chown -R mrgeek:mrgeek .

# --tags "some,tags,here"
CMD ["sh", "-c", "ansible-playbook $TAGS setup.yaml && tail -f /dev/null"]
