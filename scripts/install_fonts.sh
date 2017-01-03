#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $BASH_SOURCE); pwd)
cd $SCRIPT_DIR/../

git submodule update --init

sh $SCRIPT_DIR/../.module/powerline-fonts/install.sh
