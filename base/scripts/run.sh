#!/bin/bash

function download_jar() {
    if [ ! -f "server.jar" ]; then
        echo "Server Jar doesn't exits! Downloading one..."
        echo "$SERVER_JAR_DOWNLOAD_URL"
        curl -L -S -o server.jar "$SERVER_JAR_DOWNLOAD_URL"
    fi
}

function create_eula() {
    echo "eula=true" > eula.txt
}

function start_server() {
    echo "Starting your minecraft server in our cloud! Please wait..."
    eval "$SERVER_CMD"
}

download_jar
create_eula
start_server