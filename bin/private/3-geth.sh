#!/bin/bash
set -e

PROJECT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && cd .. && pwd)"

if [ "$#" -ne 1 ] || ! [ -d "$1" ]; then
    echo "Usage: $0 GETH_ROOT_DIRECTORY" >&2
    exit 1
fi

GETH_ROOT_DIRECTORY=$1
# https://medium.com/hackernoon/hands-on-creating-your-own-local-private-geth-node-beginner-friendly-3d45902cc612
read -p "Your first account password: "
echo "$REPLY" > ${GETH_ROOT_DIRECTORY}/geth-private/password.sec

$PROJECT_PATH/build/bin/geth --networkid 1441 --mine --miner.threads 2 --datadir "${GETH_ROOT_DIRECTORY}/geth-private" --nodiscover --http.corsdomain "*" --nat "any" --http.api eth,web3,personal,net --unlock 0 --password ${GETH_ROOT_DIRECTORY}/geth-private/password.sec --ipcpath "${GETH_ROOT_DIRECTORY}/geth-private/geth.ipc"
