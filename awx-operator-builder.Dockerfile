FROM cytopia/ansible:latest-infra as builder
ENV AWX_VERSION=20.0.0
RUN apk add --update --no-cache alpine-sdk git bash openssl-dev openssl libffi-dev \
    build-base python3-dev docker jq && \
    pip3 install cffi
RUN pip3 install docker-compose
RUN cd / && git clone -b ${AWX_VERSION} https://github.com/ansible/awx.git
WORKDIR /awx
ENTRYPOINT [ "/bin/bash" ]