#!/bin/sh

set -e

export DEVICE=athene
export VENDOR=motorola
./../../$VENDOR/msm8952-common/extract-files.sh $@
