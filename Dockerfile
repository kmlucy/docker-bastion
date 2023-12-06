FROM alpine:3
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

RUN apk add --no-cache openssh

RUN adduser -h /home/bastion -s /sbin/nologin -D bastion &&\
	sed -i -e "s/^bastion:!:/bastion:*:/" /etc/shadow

COPY sshd_config /etc/ssh/
COPY entrypoint.sh /

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
