#!/bin/sh
DEFAULT_PORT_LIST=$(pwd)/ports.txt
profile=~/.bash_profile
PREFIX=/usr/local

if [[ $(cat $profile | grep DEFAULT_PORT_LIST) == "" ]]; then
    echo "export DEFAULT_PORT_LIST=$DEFAULT_PORT_LIST" >> $profile
    cp portconn $PREFIX/bin/portconn
fi
