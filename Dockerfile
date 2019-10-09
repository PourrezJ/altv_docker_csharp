FROM debian:10

ENV LANG=C.UTF-8

ENV DEBIAN_FRONTEND noninteractive

# Install Dependencies
RUN apt-get update -y && \
 && apt-get install -y curl ca-certificates tar fontconfig tzdata iproute2 wget libc-bin && \
 && useradd -d /home/container -m container
 
RUN apt-get clean

USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]