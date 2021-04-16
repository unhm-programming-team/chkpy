# chkpy
this is a command line tool for python development meant for Linux or git-bash environments

This file is information on chkpy. chkpy uses both pycodestyle & pylint, both must be installed for this to work correctly. chkpy combuines both and outputs them in a orginised fashion as to streamline the checking process.

The instal_chkpy.sh script simply copys chkpy into the /bin folder wich is already on the path therefore making it avalabe to all users on the system.

to install chkpy simply run bash chkpy_install.sh



outline for the chkpy_installer.
use "python -c 'import sys; print(".".join(map(str, sys.version_info[:3])))'"
to check python version.
run python(version) get-pip.py


python 3.6 minimum install.
get: curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
install: python(ver) get-pip.py --user
remove: pip uninstall pip -y

python2.7
get: curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
install: python(ver) get-pip.py --user
remove: pip remove pip -y
