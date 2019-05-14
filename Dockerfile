FROM amazonlinux

# Steps needed to use systemd enabled docker containers.
# Reference: https://hub.docker.com/_/centos/
ENV container docker

RUN yum update -y && yum install -y glibc-common crontabs libpcap openssl initscripts which python-pip net-tools && yum upgrade gnupg2 && yum clean all && rm -rf /var/cache/yum

RUN echo "===> Enabling systemd..."  && \
    (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;      \
    rm -f /etc/systemd/system/*.wants/*;                      \
    rm -f /lib/systemd/system/local-fs.target.wants/*;        \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*;    \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;           \
    rm -f /lib/systemd/system/anaconda.target.wants/* 

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

CMD ["/usr/sbin/init"]
