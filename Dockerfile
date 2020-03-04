FROM openjdk:8
RUN apt-get update \
  && apt-get install -y --no-install-recommends ssh pdsh \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN mkdir /run/sshd
CMD ["/usr/sbin/sshd"]
