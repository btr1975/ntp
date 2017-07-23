# This docker file is for the automated build on docker hub
FROM ubuntu:16.04

LABEL maintainer="e_ben_75-python@yahoo.com" \
      description="This is a NTP Server" \
      package-name="ntp" \
      image-version="1.0"

RUN apt-get update \
    && apt-get install -y ntpd \
    && apt-get clean

EXPOSE 123/udp

ENTRYPOINT ["/etc/init.d/ntp", "start"]
