FROM mcr.microsoft.com/dotnet/core/runtime:3.0 
  
LABEL author="Pterodactyl Software" maintainer="support@pterodactyl.io"

ENV DEBIAN_FRONTEND noninteractive
ENV LANG=C.UTF-8

RUN apt-get update -y \
	&& echo "deb http://ftp.debian.org/debian sid main" | tee -a /etc/apt/sources.list \ 
	&& export DEBIAN_FRONTEND=noninteractive \  
 	&& apt-get install -y curl iproute2 \
 	&& useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]