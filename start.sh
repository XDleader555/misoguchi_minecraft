#!/bin/bash

# Start the server from the folder of the jar
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "$BINDIR"

# run the server
java -Xms1G -Xmx3G -XX:+UseLargePages -jar paper.jar -nogui
