#!/bin/bash
PythonVersion="$( python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
if [ $PythonVersion -ge 30 ]
then
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
/usr/bin/python3 -m pip install --upgrade pip
rm /home/test/get-pip.py
fi

if [ $PythonVersion -le 27 ]
then
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
python2 get-pip.py --user
/usr/bin/python2 -m pip install --upgrade pip
rm /home/test/get-pip.py
fi
