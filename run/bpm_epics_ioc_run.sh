#!/bin/bash

BPM_IDX=$1

TEST_FOLDER=/tmp/repos/test

if [ ! $# -eq 1 ]
  then
    echo "Wrong usage! $0 <BPM_IDX>"
    exit
fi

sudo systemctl stop halcs-be-ioc@${BPM_IDX}
sudo systemctl mask halcs-be-ioc@${BPM_IDX}

read -p "Press ENTER to run bpm-epics-ioc @${BPM_IDX}"

source ioc_env.sh
cd ${TEST_FOLDER}/bpm-epics-ioc/iocBoot/iocBPM
./runBPM.sh ipc:///tmp/malamute ${BPM_IDX}

sudo systemctl unmask halcs-be-ioc@${BPM_IDX}
sudo systemctl restart halcs-be-ioc@${BPM_IDX}
