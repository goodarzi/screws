#!/usr/bin/env bash 
set -e
set -x

apt install install libopusfile-dev libopusenc-dev

wget https://api.github.com/repos/traud/asterisk-opus/tarball -O asterisk-opus.tar.gz
tar -xvf asterisk-opus.tar.gz
cd traud-asterisk-opus*

make CPATH="-I/usr/src/asterisk-20.3.0/include/ -I/usr/include/opus/"

# MODULES=$(ls */*.so)
# chown asterisk:asterisk $MODULES

make install 
