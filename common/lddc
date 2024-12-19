#!/bin/sh

usage() {
    echo "Usage: $0 <path to binary> <path to copy dependencies>" >&2
    exit 1
}

[ $# -lt 2 ] && usage
[ ! -e "$1" ] && { echo "Invalid input: $1"; exit 1; }
[ ! -d "$2" ] && { mkdir -p "$2"; }

ldd "$1" | awk '/=> \// {print $3} /^\// {print $1}' | xargs -I{} cp --update -v {} "$2"
