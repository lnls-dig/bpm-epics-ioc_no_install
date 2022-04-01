#!/bin/bash

BPM_IDX=$1

TEST_FOLDER=/home/lnls-bpm/repos/test

sudo systemctl stop halcs-be@${BPM_IDX}
sudo systemctl mask halcs-be@${BPM_IDX}

source ioc_env.sh
cd ${TEST_FOLDER}/bpm-epics-ioc/iocBoot/iocBPM
./runBPM.sh ipc:///tmp/malamute ${BPM_IDX}
