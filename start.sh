#!/bin/bash

# Start the server from the folder of the jar
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "$BINDIR"

# run the server
java -Xms1G -Xmx6G -jar paper-1.18.1-150.jar -nogui
