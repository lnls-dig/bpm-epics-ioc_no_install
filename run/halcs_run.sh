#!/bin/bash

BPM_IDX=$1

TEST_FOLDER=/home/lnls-bpm/repos/test

sudo systemctl stop halcs-be-ioc@${BPM_IDX}
sudo systemctl mask halcs-be-ioc@${BPM_IDX}

cd ${TEST_FOLDER}/halcs/build/src/apps/halcsd
./halcsd -f /etc/halcs/halcs.cfg -n be -t pcie -i ${BPM_IDX} -b ipc:///tmp/malamute -l /tmp/log/halcs