#!/bin/bash
BASEDIR=$(dirname $0)
printf ${BASEDIR}
export LD_LIBRARY_PATH=${BASEDIR}
./altv-server
