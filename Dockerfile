FROM        ubuntu:18.04 as cmake

LABEL       author="Djoe_" maintainer="flashxbox41@gmail.com"

RUN         apt-get update && \
            apt-get install -y --no-install-recommends build-essential cmake wget ca-certificates curl openssl libstdc++ iproute2 && \
            adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]