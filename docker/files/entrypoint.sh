#!/bin/bash

LISTEN_PORT=${LISTEN_PORT:-9060}
DB_BULK=${ENV_DB_BULK:-500}

PATH_HEPLIFY_SERVER_TOML_M4=/root/heplify-server.toml.m4
PATH_HEPLIFY_SERVER_TOML=/root/heplify-server.toml

m4 -D LISTEN_HOST=$ENV_LISTEN_HOST \
  -D LISTEN_PORT=$LISTEN_PORT \
  -D DB_HOST=$ENV_DB_HOST \
  -D DB_USER=$ENV_DB_USER \
  -D DB_PASS=$ENV_DB_PASSWORD \
  -D DB_PORT=$ENV_DB_PORT \
  -D DB_BULK=$DB_BULK \
  $PATH_HEPLIFY_SERVER_TOML_M4 > $PATH_HEPLIFY_SERVER_TOML

chmod 775 $PATH_HEPLIFY_SERVER_TOML

/root/heplify-server /root/heplify-server.toml