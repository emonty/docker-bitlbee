#!/bin/bash

set -e

DEV_PACKAGES="git libglib2.0-dev libotr5-dev libgnutls28-dev build-essential xmlto w3m ca-certificates"
PACKAGES="supervisor
libffi6
libgcrypt11
libglib2.0-0
libgmp10
libgnutls28
libgpg-error0
libhogweed2
libnettle4
libotr5
libp11-kit0
libpcre3
libtasn1-6
zlib1g"


apt-get update
apt-get install -y $PACKAGES $DEV_PACKAGES

# Get latest source
git clone -b feat/hip-cat https://github.com/dequis/bitlbee.git
cd bitlbee
./configure --otr=1
make
make install

# Clean up - make image size smaller
apt-get remove -y $DEV_PACKAGES
apt-get autoremove -y
apt-get clean
cd ..
rm -rf bitlbee
