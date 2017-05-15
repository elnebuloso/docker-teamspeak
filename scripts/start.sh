#!/bin/sh
VOLUME=/teamspeak3

# keep previous database
ln -s $VOLUME/ts3server.sqlitedb /opt/teamspeak3-server_linux_amd64/ts3server.sqlitedb

# run teamspeak server
/opt/teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh