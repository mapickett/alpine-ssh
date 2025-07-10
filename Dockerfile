# syntax=docker/dockerfile:1

FROM alpine:3

LABEL org.opencontainers.image.source=https://github.com/mapickett/alpine-ssh
LABEL org.opencontainers.image.description="Custom alpine image running sshd for use with Containerlab"

COPY rootfs /

RUN apk add --no-cache openssh doas \
  && adduser -D admin && echo "admin:admin" | chpasswd \
  && echo "permit nopass admin as root" > /etc/doas.d/doas.conf

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]