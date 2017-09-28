# tftp in a container
FROM ubuntu:14.04
RUN apt-get update && apt-get install -y tftpd-hpa
RUN mkdir /tmp/tftp
RUN chmod 777 /tmp/tftp
RUN chown nobody /tmp/tftp
EXPOSE 69/udp
EXPOSE 49152-49160/udp
VOLUME /var/lib/tftpboot
CMD /usr/sbin/in.tftpd --foreground --create --permissive --user nobody --port-range 49152:49160  --secure /tmp/tftp







#FROM ubuntu:latest

#RUN apt-get update && apt-get upgrade -y && apt-get install -y tftpd-hpa tcpdump vim

#COPY tftpd-hpa /etc/default/

#RUN mkdir /tftpboot
#RUN chmod -R 777 /tftpboot
#RUN chown -R nobody /tftpboot

#ENTRYPOINT ["service"]
#CMD ["tftpd-hpa", "restart"]








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
