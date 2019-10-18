FROM debian:10

ENV LANG=C.UTF-8

ENV DEBIAN_FRONTEND noninteractive

# Install Prereqs
RUN apt-get update && \
    apt-get install -y wget unzip curl libc-bin gettext-base

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash && \
	apt-get install -y nodejs

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential cmake ca-certificates openssl iproute2 && \
    adduser -D -h /home/container container
    
RUN apt-get clean

USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]