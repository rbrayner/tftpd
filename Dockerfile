FROM alpine:3.6

RUN apk add --no-cache tftp-hpa
RUN apk add --no-cache tcpdump

#VOLUME /tftpboot
RUN mkdir /tftpboot
RUN chmod 777 /tftpboot
RUN chown nobody.nobody -R /tftpboot

EXPOSE 69/udp

ENTRYPOINT ["/usr/sbin/in.tftpd"]
CMD ["-L", "-c", "-v", "--secure", "/tftpboot"]
