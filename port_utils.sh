#!/bin/bash
#
# Utilities for connecting/disconnecting ports over ssh
# (c) 2018 John Hoffman


is_connected() {
    port=${1}
    for pid in `pgrep -f "ssh -fNT -L $port"`; do
        if [[ $pid != "" ]]; then
            echo "connected"
        fi
    done
}

disconnect_port(){
    port=${1}
    for pid in `pgrep -f "ssh -fNT -L $port"`; do
        if [[ $pid == "" ]]; then
            continue
        fi

        echo "[port $port] killing pid $pid"
        kill -9 $pid
    done

}

connect_port(){
    port=${1}
    host=${2}
    if [[ $(is_connected $port) == "connected" ]]; then
        echo "Port $port is already connected."
    else
        echo "== forwarding $port@$host -> localhost:$port  =="
        ssh -fNT -L ${1}:localhost:${1} $2
    fi
}

