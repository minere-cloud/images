FROM eclipse-temurin:17-jre-jammy

ENV SERVER_JAR_TYPE=paper \
    SERVER_JAR_VERSION=1.20.2 \
    JVM_ARGS="-Xms2048m -Xmx2048m" \
    DEFAULT_CONSOLE_STDIN_FILE=/var/run/console.stdin

RUN apt-get update && apt-get install -y dumb-init && \
    useradd --no-create-home minecraft && \
    mkdir -p /data/minecraft && \
    chown minecraft:minecraft /data/minecraft && \
    touch "$DEFAULT_CONSOLE_STDIN_FILE" && \
    chmod 644 "$DEFAULT_CONSOLE_STDIN_FILE"     

WORKDIR /data/minecraft

USER minecraft

COPY scripts /usr/local/bin/

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD [ "run.sh" ]

STOPSIGNAL SIGINT