#!/bin/bash

CRATE_PREFIX=$1
BPM_IDX=$2

TEST_FOLDER=/tmp/repos/test

if [ ! $# -eq 2 ]
  then
    echo "Wrong usage! $0 <CRATE_PREFIX> <BPM_IDX>"
    exit
fi

sudo systemctl stop halcs-be-ioc@${BPM_IDX}
sudo systemctl mask halcs-be-ioc@${BPM_IDX}

read -p "Press ENTER to run bpm-epics-ioc @${BPM_IDX}"

cd ${TEST_FOLDER}/bpm-epics-ioc/iocBoot/iocBPM
source ioc_env.sh
export EPICS_PV_CRATE_PREFIX="CRATE_${CRATE_PREFIX}"
./runBPM.sh ipc:///tmp/malamute ${BPM_IDX}

sudo systemctl unmask halcs-be-ioc@${BPM_IDX}
sudo systemctl restart halcs-be-ioc@${BPM_IDX}
