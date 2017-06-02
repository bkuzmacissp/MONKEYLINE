#!/usr/bin/env bash

apt-get update

# install python
apt-get install python-dev python-pip -q -y
apt-get install git -q -y
apt-get install gcc -q -y
apt-get install gdb -q -y
apt-get install nasm -q -y
apt-get install libncurses5-dev -q -y
pip install --upgrade pip


