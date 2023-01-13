#!/bin/bash
set -e

PROJECT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && cd .. && pwd)"

if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then
    echo "Usage: $0 GETH_ROOT_DIRECTORY" >&2
    exit 1
fi

GETH_ROOT_DIRECTORY=$1

$PROJECT_PATH/build/bin/clef newaccount --keystore ${GETH_ROOT_DIRECTORY}/geth-tutorial/keystore
if [[ ! -d ${GETH_ROOT_DIRECTORY}/geth-tutorial/clef ]]; then
    mkdir -p ${GETH_ROOT_DIRECTORY}/geth-tutorial/clef
fi
$PROJECT_PATH/build/bin/clef --keystore ${GETH_ROOT_DIRECTORY}/geth-tutorial/keystore --configdir ${GETH_ROOT_DIRECTORY}/geth-tutorial/clef --chainid 11155111
