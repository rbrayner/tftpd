FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y tftpd-hpa tcpdump vim

COPY tftpd-hpa /etc/default/

#RUN mkdir /tftpboot
#RUN chmod -R 777 /tftpboot
#RUN chown -R nobody /tftpboot

ENTRYPOINT ["service"]
CMD ["tftpd-hpa", "restart"]








#FROM ubuntu:latest

#RUN apt-get update && apt-get upgrade -y && apt-get install -y xinetd tftpd tftp

#COPY tftp /etc/xinetd.d/

#RUN mkdir /tftpboot
#RUN chmod -R 777 /tftpboot
#RUN chown -R nobody /tftpboot

#ENTRYPOINT ["service"]
#CMD ["xinetd", "restart"]


# --


#FROM alpine:3.6

#RUN apk add --no-cache tftp-hpa
#RUN apk add --no-cache tcpdump

#VOLUME /tftpboot
#RUN mkdir /tftpboot
#RUN chmod 777 /tftpboot
#RUN chown nobody.nobody -R /tftpboot

#EXPOSE 69/udp

#ENTRYPOINT ["/usr/sbin/in.tftpd"]
#CMD ["-L", "-c", "-v", "--secure", "/tftpboot"]
