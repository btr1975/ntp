# This docker file is for the automated build on docker hub
FROM ubuntu:16.04

LABEL maintainer="e_ben_75-python@yahoo.com" \
      description="This is a NTP Server" \
      notes="ntpq -np will show you the list of ntp servers, and if they are syncing" \
      package-name="ntp" \
      image-version="1.0"

RUN apt-get update \
    && apt-get install -y ntp \
    && apt-get clean

COPY ./ntp.conf /etc/

RUN chmod 644 /etc/ntp.conf

EXPOSE 123/udp

ENTRYPOINT ["ntpd", "-d"]
