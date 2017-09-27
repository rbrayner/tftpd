FROM alpine:3.6

RUN apk add --no-cache tftp-hpa
RUN apk add --no-cache tcpdump
VOLUME /var/tftpboot
EXPOSE 69/udp
ENTRYPOINT ["in.tftpd"]
CMD ["-l", "--address", "0.0.0.0:69", "-c", "-v", "-u", "root", "--secure", "/var/tftpboot"]
