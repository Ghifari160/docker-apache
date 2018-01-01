FROM ubuntu:zesty

MAINTAINER Ghifari160 <ghifari160@ghifari160.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y apache2 && rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
