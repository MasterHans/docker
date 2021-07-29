FROM ubuntu:latest
MAINTAINER masterhans75@hotmail.com
RUN apt-get update && apt-get install -y
#Нужно при установке mc выберать регион а это пока не понятно как сделать пакетно
#RUN apt install mc -y
RUN apt-get install mysql-server -y
EXPOSE 3306
CMD ["/usr/bin/MySQLd_safe"]