FROM eclipse-temurin:17-jre-jammy

ENV SERVER_JAR_TYPE=paper \
    SERVER_JAR_VERSION=1.20.4 \
    JVM_ARGS="-Xms2048m -Xmx2048m" \
    SERVER_JAR_DOWNLOAD_URL="$HERMES_API_URL/v1/download/serverjar/$SERVER_JAR_TYPE/$SERVER_JAR_VERSION" \
    SERVER_CMD="java "$JVM_ARGS" -jar server.jar --nogui"

RUN apt-get update && apt-get install -y dumb-init && \
    useradd --no-create-home minecraft && \
    mkdir -p /data/minecraft && \
    chown minecraft:minecraft /data/minecraft 

WORKDIR /data/minecraft

USER minecraft

COPY base/scripts /usr/local/bin/

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD [ "run.sh" ]

STOPSIGNAL SIGINT