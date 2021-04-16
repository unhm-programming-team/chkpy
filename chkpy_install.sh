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

if [ $input -eq 1 ]
then
echo " welcome to chkpy!"
echo "installing dependances: pycodestyle,pylint & autopep8"
echo " "
currentver="$(python3 --version)"
echo "checking python version for compatibilty, minimum version is ${currentver}!"
echo " "
requiredver="3.8.5"
if [ "$(printf '%s\n' "$requiredver" "$currentver" | sort -V | head -n1)" = "$requiredver" ];
then
echo "Minimum or greater version requirement met!"
else
echo "you do not have the minimum required python version you need ${requiredver} or better" || die
fi
echo " "
echo "##################################################################"
echo " "
pip3 install pycodestyle
echo " "
pip3 install pylint
echo " "
pip3 install autopep8
chmod +wrx chkpy
cp chkpy /bin
echo " "
echo "##################################################################"
echo " "
fi

if [ $input -eq 2 ]
then
echo "sad to see you go"
echo "removeing chkpy and dependances..."
echo " "
echo "##################################################################"
echo " "
pip3 uninstall pycodestyle -y
echo " "
pip3 uninstall pylint -y
echo " "
pip3 uninstall autopep8 -y
rm /bin/chkpy
echo " "
echo "##################################################################"
echo " "
fi

if [ $input -eq 3 ]
then
echo "sad to see you go...keep the tools ok?"
echo "removeing chkpy"
echo " "
echo "##################################################################"
echo " "
rm /bin/chkpy
echo "removed chkpy"
echo " "
echo "##################################################################"
echo " "
fi
