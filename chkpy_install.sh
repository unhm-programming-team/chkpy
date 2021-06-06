#!/bin/bash
#this is to install/move the chkpy script to the right location and add it to the path
echo " "
echo "        _       _                      _  "
echo "  ___  | |__   | | __  _ __    _   _  | | "
echo " / __| | '_ \  | |/ / | '_ \  | | | | | | "
echo "| (__  | | | | |   <  | |_) | | |_| | |_| "
echo " \___| |_| |_| |_|\_\ | .__/   \__, | (_) "
echo "                      |_|      |___/      "
echo " "
echo "welcome to the chkpy installer. please make a selection"
echo "install chkpy (1) or remove chkpy (2) or remove witout dependances(3)"
read input
PipVersion=none
###############################################################################


###############################################################################
#handles installation of autopep8, pylint, pycodestyle, and pip if it applys
if [ $input -eq 1 ]
then
echo " welcome to chkpy!"
echo "installing dependances: pycodestyle,pylint & autopep8"
echo " "

#checks pythoin version so later code can grab the right pip version
PythonVersion="$( python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"

#if python version 3.0.0 or greater (expressed as 300) it grabs the most
#current version of pip3 and installs it
if [ $PythonVersion -ge 30 ]
then
PipVersion=pip3
sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py > /dev/null
python3 get-pip.py --user
/usr/bin/python3 -m pip install --upgrade pip > /dev/null
fi

#if python version 2.7.0 or lesser (expressed as 270) it grabs the most
#current version of pip2 and installs it, althoug depricated.
if [ $PythonVersion -le 27 ]
then
PipVersion=pip2
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py > /dev/null
python2 get-pip.py --user
/usr/bin/python2 -m pip install --upgrade pip > /dev/null
fi

#installing pylint, pycodestyle, and autopep8.
echo " "
echo "##################################################################"
echo " "
echo "installing pycodestyle"

$PipVersion install pycodestyle > /dev/null
echo " "
echo "installing pylint"
$PipVersion install pylint > /dev/null
echo " "
echo "installing autopep8"
$PipVersion install autopep8 > /dev/null
sudo chmod +wrx chkpy
echo ""
echo "installing chkpy"
sudo cp chkpy /bin
echo " "
echo "##################################################################"
echo " "
fi
###############################################################################


###############################################################################
#handles removeing chkpy, pycodestyle, pylint and autopep8
if [ $input -eq 2 ]
then
#checks pythoin version so later code can grab the right pip version
PythonVersion="$( python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
if [ $PythonVersion -ge 30 ]
then
PipVersion=pip3
fi

if [ $PythonVersion -le 27 ]
then
PipVersion=pip2
fi

echo "sad to see you go"
echo "removeing chkpy and dependances..."
echo " "
echo "##################################################################"
echo " "
echo "uninstalling pycodestyle"
echo " "
$PipVersion uninstall pycodestyle -y
echo " "
echo "uninstalling pylint"
echo " "
$PipVersion uninstall pylint -y
echo " "
echo "uninstalling autopep8"
echo " "
$PipVersion uninstall autopep8 -y
echo " "
sudo rm /bin/chkpy
echo "removeing chkpy"
echo " "
echo "##################################################################"
echo " "
fi
###############################################################################


###############################################################################
#handles removeing chkpy but leaves pycodestyle, pylint and autopep8 behind
if [ $input -eq 3 ]
then
echo "sad to see you go...keep the tools ok?"
echo "removeing chkpy"
echo " "
echo "##################################################################"
echo " "
sudo rm /bin/chkpy
echo "removed chkpy"
echo " "
echo "##################################################################"
echo " "
fi
