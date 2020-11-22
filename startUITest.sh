#!/bin/bash
cd ./dex
npm i

sleep 2

cd ./client
npm i
gnome-terminal -- /bin/sh -c 'npm start'
cd ../..
gnome-terminal -- /bin/sh -c 'cd ./HODL2_patch1; ./node_modules/.bin/ganache-cli -m "twenty bulk regular excess orchard blade route lyrics rail panic federal crawl"; sleep 2'
gnome-terminal -- /bin/sh -c 'cd ./HODL2_patch1; ./node_modules/.bin/truffle migrate'
sleep 10
gnome-terminal -- /bin/sh -c 'cd ./HODL2_patch1; ./node_modules/.bin/truffle exec ../truffleScript.js --network development;'

FILE=./addresses.txt

UIFILE=./dex/client/src/network-config.js
if test -f "$FILE"; then
    echo "$FILE exists"
    export $(grep -v '^#' addresses.txt | xargs -d '\n')
    echo "TOKEN ADDRESS: $HTETHUSD"
    sed -i \
        -e "44s/\(dexContractAddress\:[[:space:]]\).*/\1'$HODLDEX_PROXY',/" \
        -e "45s/\(tokenContractAddress\:[[:space:]]\).*/\1'$HTETHUSD',/" \
        -e "46s/\(tokenReserveContractAddress\:[[:space:]]\).*/\1'$HTOKENRESERVE_PROXY',/" \
        $UIFILE
  
    else
        echo "doesnt exist"
fi


