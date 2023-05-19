FROM	debian:buster

WORKDIR	/app

RUN		apt update && apt upgrade -y;
RUN		apt install -y vsftpd vim telnet;

COPY	./tools/ftp_server_script.sh .
COPY	./conf/vsftpd.conf /etc/vsftpd.conf

EXPOSE	20
EXPOSE	21
EXPOSE	22
EXPOSE	990
EXPOSE	40000-40009

ENTRYPOINT [ "bash", "ftp_server_script.sh" ]
