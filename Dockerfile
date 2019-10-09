FROM        ubuntu:18.10

LABEL       author="Djoe_" maintainer="flashxbox41@gmail.com"

RUN         apt-get update && \
            apt-get install -y --no-install-recommends build-essential cmake wget ca-certificates iproute2 curl tar libstdc++6 libc-bin libc6 libc6-dev libc6-dbg && \
            adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]