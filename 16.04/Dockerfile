FROM ghifari160/ubuntu:16.04

MAINTAINER Ghifari160 <ghifari160@ghifari160.com>

# disable interactive elements
ENV DEBIAN_FRONTEND noninteractive

# install apache2 and cleanup
RUN apt update && apt install -y apache2 && apt clean && \
    rm -rf /var/lib/apt/lists/*

# expose the default port for apache
EXPOSE 80

# symlink apache logs to stdio
RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
