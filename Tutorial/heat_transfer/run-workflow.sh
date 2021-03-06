#!/bin/sh
set -eu

if [ ${#} != 1 ]
then
  echo "Requires PROCS!"
  exit 1
fi

PROCS=$1

# USER: Set this to the correct location:
LAUNCH=$HOME/proj/mpix_launch_swift/src

MACHINE=${MACHINE:-}

THIS=$( dirname $0 )

stc -p -u -I $LAUNCH -r $LAUNCH workflow.swift
turbine -n $PROCS $MACHINE workflow.tic
