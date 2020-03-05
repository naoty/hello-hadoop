FROM openjdk:8
RUN apt-get update \
  && apt-get install -y --no-install-recommends ssh \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN mkdir /run/sshd \
  && ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa \
  && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
  && chmod 0600 ~/.ssh/authorized_keys
RUN wget -q -O - http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz | tar zxf -
ENV PATH=/hadoop-3.2.1/bin:/hadoop-3.2.1/sbin:$PATH
COPY config /hadoop-3.2.1/etc/hadoop/
CMD ["/usr/sbin/sshd"]
