ARG BASE_IMAGE=alpine:latest

FROM ${BASE_IMAGE}
LABEL maintainer="Rey"

RUN         apk add --no-cache python3 py3-pip
RUN         pip install aiosmtpd
RUN         pip install nullsmtpd

USER       root
WORKDIR    /tmp

EXPOSE      5587
CMD [ "nullsmtpd", "-H", "0.0.0.0", "-P", "5587", "--no-fork" ]
