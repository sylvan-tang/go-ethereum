#!/bin/bash
set -e

PROJECT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && cd .. && pwd)"

if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then
    echo "Usage: $0 GETH_ROOT_DIRECTORY" >&2
    exit 1
fi

GETH_ROOT_DIRECTORY=$1

$PROJECT_PATH/build/bin/geth --datadir ${GETH_ROOT_DIRECTORY}/geth-private account new
$PROJECT_PATH/build/bin/geth --datadir ${GETH_ROOT_DIRECTORY}/geth-private account list
