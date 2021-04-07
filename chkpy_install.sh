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
echo "##################################################################"
echo " "
pip install pycodestyle
echo " "
pip install pylint 
echo " "
pip install autopep8
sudo cp chkpy /bin
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
pip uninstall pycodestyle -y
echo " "
pip uninstall pylint -y
echo " "
pip uninstall autopep8 -y
sudo rm /bin/chkpy
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
sudo rm /bin/chkpy
echo "removed chkpy"
echo " "
echo "##################################################################"
echo " "
fi
