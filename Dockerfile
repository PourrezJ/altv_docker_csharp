FROM busybox:glibc

ENV LANG=C.UTF-8

RUN apt-get update -y \
 && apt-get install -y wget curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
 && useradd -d /home/container -m container

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash && \
	apt-get install -y nodejs

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]