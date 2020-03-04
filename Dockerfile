FROM openjdk:8
RUN apt-get update \
  && apt-get install -y --no-install-recommends ssh pdsh \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN mkdir /run/sshd
RUN wget -q -O - http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz | tar zxf -
ENV PATH=/hadoop-3.2.1/bin:/hadoop-3.2.1/sbin:$PATH
CMD ["/usr/sbin/sshd"]
