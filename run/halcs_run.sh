#!/bin/bash

BPM_IDX=$1

TEST_FOLDER=/tmp/repos/test

if [ ! $# -eq 1 ]
  then
    echo "Wrong usage! $0 <BPM_IDX>"
    exit
fi

sudo systemctl stop halcs-be@${BPM_IDX}
sudo systemctl mask halcs-be@${BPM_IDX}

read -p "Press ENTER to run halcs @${BPM_IDX}"

cd ${TEST_FOLDER}/halcs/build/src/apps/halcsd
./halcsd -f /etc/halcs/halcs.cfg -n be -t pcie -i ${BPM_IDX} -b ipc:///tmp/malamute -l /tmp/log/halcs

sudo systemctl unmask halcs-be@${BPM_IDX}
sudo systemctl restart halcs-be@${BPM_IDX}
