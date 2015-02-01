#!/bin/bash

set -e

PACKAGES="supervisor bitlbee-libpurple"

apt-get update
apt-get install -y $PACKAGES

# Clean up - make image size smaller
apt-get autoremove -y
apt-get clean
