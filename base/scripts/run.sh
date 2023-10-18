#!/bin/bash

function download_jar() {
    if [ ! -f "server.jar" ]; then
        echo "Server Jar doesn't exits! Downloading one..."
        echo "$SERVER_JAR_DOWNLOAD_URL"
        curl -L -S -o server.jar "$HERMES_API_URL"/v1/download/serverjar/"$SERVER_JAR_TYPE"/"$SERVER_JAR_VERSION" 
    fi
}

function create_eula() {
    echo "eula=true" > eula.txt
}

function start_server() {
    echo "Starting your minecraft server in our cloud! Please wait..."
    tail -q -f "$DEFAULT_CONSOLE_STDIN_FILE" | eval java "$JVM_ARGS" -jar server.jar --nogui
}

download_jar
create_eula
start_server