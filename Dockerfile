FROM mcr.microsoft.com/dotnet/core/sdk:2.2.104 as dotnet

ARG bridge_version=1.0.0.0

ENV NUGET_XMLDOC_MODE=skip
ENV DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

ENV LANG=C.UTF-8

ENV         DEBIAN_FRONTEND noninteractive

# Install Dependencies
RUN apt-get update
RUN apt-get install -y \
    libunwind8 \
    icu-devtools \
    curl \
    libssl-dev && \
    rm -rf /var/lib/apt/lists/* \
	&& useradd -m -d /home/container container
	
	
USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]