#!/bin/bash
#
# simple bash script for forwarding ports
# (c) 2018 John Hoffman
# MIT license

# utils
. port_utils.sh

# defaults
mode='connect'
portlist='ports.txt'
port=''
host=''

# help page
usage() {
    echo "bash ports.sh [options]"
    echo ""
    echo "options"
    echo "  -h, --help          show this usage page"
    echo "  -r, --reset         reset connections"
    echo "  -d, --disconnect    disconnect ports"
    echo "  -c, --connect       connect ports"
    echo "  -l, --list          port list file"
    echo "  -p, --port          port number"
    echo "  -h, --host          host machine"
    exit 1
}

# process (port, host)
process() {
    port=$1
    host=$2

    case $mode in
        connect)
            connect_port $port $host
            ;;
        disconnect)
            disconnect_port $port
            ;;
        reset)
            disconnect_port $port
            connect_port $port $host
            ;;
        *)
            echo "Don't understand mode = '${mode}'"
            exit 1
            ;;
    esac
}

# process command line
while [[ $# -gt 0 ]]; do
    key=$1
    case $key in
        -h|--help)
            usage
            ;;
        -r|--reset)
            mode='reset'
            shift
            ;;
        -c|--connect)
            mode='connect'
            shift
            ;;
        -d|--disconnect)
            mode='disconnect'
            shift
            ;;
        -l|--list)
            portlist=$2
            shift
            shift
            ;;
        -p|--port)
            port=$2
            shift
            shift
            ;;
        -h|--host)
            host=$2
            shift
            shift
            ;;
        *)
            usage
            ;;
    esac
done

# single (port, host)
if [[ $port != '' ]]; then
    if [[ $host == '' ]]; then
        echo "Error: must specify host when specifying a port"
        usage
    fi

    process $port $host

# multiple (port, host) from list
else
    while read port host; do
        process $port $host
    done < $portlist
fi
