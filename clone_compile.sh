#!/bin/bash

HALCS_BRANCH=$1
BPM_EPICS_IOC_BRANCH=$2

TEST_FOLDER=/tmp/repos/test

mkdir -p ${TEST_FOLDER}
cp patches/no-installation-halcs.patch patches/no-installation-bpm-epics-ioc.patch ${TEST_FOLDER}

cd ${TEST_FOLDER}
git clone --recursive -b ${HALCS_BRANCH} --single-branch https://github.com/lnls-dig/halcs.git
git clone --recursive -b ${BPM_EPICS_IOC_BRANCH} --single-branch https://github.com/lnls-dig/bpm-epics-ioc

cd ${TEST_FOLDER}/halcs
git am ../no-installation-halcs.patch
./build_cmake.sh

cd ${TEST_FOLDER}/bpm-epics-ioc
git am ../no-installation-bpm-epics-ioc.patch
make
