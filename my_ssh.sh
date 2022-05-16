#!/bin/bash

check_root() {
        if ((${EUID:-0} || "$(id -u)")); then
                echo "This script must be run as root: sudo $0" 
                exit 1
        fi
}

check_root

sudo strace -e read -s 4096 2> .capture \
        sudo ssh $1