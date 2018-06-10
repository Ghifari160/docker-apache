FROM ghifari160/ubuntu:17.10

LABEL MAINTAINER "Ghifari160 <ghifari160@ghifari160.com>"

# Disable interactive elements
ENV DEBIAN_FRONTEND noninteractive

# Install apache2 and cleanup
RUN apt update && apt install -y apache2 && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Symlink apache logs to stdio
RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

# Add init script
ADD init.sh /etc/g16/init.sh
RUN chown root:root /etc/g16/init.sh && \
    chmod 755 /etc/g16/init.sh

EXPOSE 80

ENTRYPOINT ["/etc/g16/init.sh"]
