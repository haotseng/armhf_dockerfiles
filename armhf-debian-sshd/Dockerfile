
FROM ebspace/armhf-debian:latest

MAINTAINER Hao Tseng "ebspace@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

# Install openssh-server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the root password : 'root'
RUN echo 'root:root' |chpasswd

# Modify the /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd && \
    sed -ri "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config


EXPOSE 22

CMD [ \
      "/usr/sbin/sshd", \
      # sshd will not detach and does not become a daemon
      "-D", \
      # Write debug logs to standard error instead of the system log.
      "-e" \
    ]
