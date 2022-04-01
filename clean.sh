#!/bin/bash

BPM_IDX=$1

TEST_FOLDER=/home/lnls-bpm/repos/test

sudo rm -rf ${TEST_FOLDER}
sudo systemctl unmask halcs-be-ioc@${BPM_IDX} halcs-be-ioc@${BPM_IDX}
sudo systemctl start halcs-be-ioc@${BPM_IDX} halcs-be-ioc@${BPM_IDX}
