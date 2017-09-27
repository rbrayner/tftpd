FROM alpine:3.6

RUN apk add --no-cache tftp-hpa
RUN apk add --no-cache tcpdump
VOLUME /var/tftpboot
EXPOSE 69/udp
ENTRYPOINT ["in.tftpd"]
CMD ["-L", "-c", "-v", "--secure", "/var/tftpboot"]
