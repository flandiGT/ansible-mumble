#!/bin/sh

DEFAULT_CONFIG_FILE=/opt/mumble/default_config.ini
CONFIG_FILE=/etc/mumble/config.ini

if [ ! -f ${CONFIG_FILE} ]
then
    cp -a ${DEFAULT_CONFIG_FILE} ${CONFIG_FILE}
fi

/opt/mumble/murmur.x86 -fg -ini /etc/mumble/config.ini
