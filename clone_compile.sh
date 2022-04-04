#!/bin/bash

TEST_TAG=test_interlock
TEST_FOLDER=/home/lnls-bpm/repos/test

mkdir -p ${TEST_FOLDER}
cp patches/no-installation-halcs.patch patches/no-installation-bpm-epics-ioc.patch ${TEST_FOLDER}

cd ${TEST_FOLDER}
git clone --recursive -b ${TEST_TAG} --single-branch https://github.com/lnls-dig/halcs.git
git clone --recursive -b ${TEST_TAG} --single-branch https://github.com/lnls-dig/bpm-epics-ioc

cd ${TEST_FOLDER}/halcs
git am ../no-installation-halcs.patch
./build_cmake.sh

cd ${TEST_FOLDER}/bpm-epics-ioc
git am ../no-installation-bpm-epics-ioc.patch
make
