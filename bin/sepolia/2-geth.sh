#!/bin/bash
set -e

PROJECT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && cd .. && pwd)"

if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then
    echo "Usage: $0 GETH_ROOT_DIRECTORY" >&2
    exit 1
fi

GETH_ROOT_DIRECTORY=$1

if [[ ! -d ${GETH_ROOT_DIRECTORY}/geth-tutorial ]]; then
    mkdir -p ${GETH_ROOT_DIRECTORY}/geth-tutorial
fi

$PROJECT_PATH/build/bin/geth --sepolia --datadir ${GETH_ROOT_DIRECTORY}/geth-tutorial --authrpc.addr localhost --authrpc.port 8551 --authrpc.vhosts localhost --authrpc.jwtsecret ${GETH_ROOT_DIRECTORY}/geth-tutorial/jwtsecret --http --http.api eth,net --signer=${GETH_ROOT_DIRECTORY}/geth-tutorial/clef/clef.ipc --http
