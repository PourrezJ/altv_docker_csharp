FROM mcr.microsoft.com/dotnet/core/sdk:2.2.104 as dotnet

ARG bridge_version=1.0.0.0

ENV NUGET_XMLDOC_MODE=skip
ENV DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

ENV LANG=C.UTF-8

ENV DEBIAN_FRONTEND noninteractive

# Install Dependencies
RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar fontconfig tzdata iproute2 wget libstdc++6 libc6 libc6-dev libc6-dbg\
 && useradd -d /home/container -m container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]