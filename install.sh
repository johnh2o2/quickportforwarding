#!/bin/sh
#
# Rudimentary installation bash script for portconn
# (c) 2018 John Hoffman

DEFAULT_PORT_LIST=$(pwd)/ports.txt
profile=~/.bash_profile
PREFIX=/usr/local

if [[ $(cat $profile | grep DEFAULT_PORT_LIST) == "" ]]; then
    echo "export DEFAULT_PORT_LIST=$DEFAULT_PORT_LIST" >> $profile
    cp portconn $PREFIX/bin/portconn
else
    echo "From $profile:"
    echo ""
    cat $profile | grep DEFAULT_PORT_LIST
    echo ""
    echo "Already found a definition of DEFAULT_PORT_LIST in $profile."
    echo "to change the default portlist redefine DEFAULT_PORT_LIST"
    echo "to point to another path."
fi
