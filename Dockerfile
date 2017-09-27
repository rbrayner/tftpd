FROM alpine:3.6

RUN apk add --no-cache tftp-hpa
RUN apk add --no-cache tcpdump
#VOLUME /tftpboot
RUN mkdir /tftpboot
RUN chmod 777 /tftpboot
EXPOSE 69/udp
ENTRYPOINT ["in.tftpd"]
CMD ["-L", "-c", "--blocksize", "1468", "-v", "--secure", "/tftpboot"]
