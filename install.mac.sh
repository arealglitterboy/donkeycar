#
# dependencies:
# - python=3.7
# -  pip
#
# python3 -m venv env
# . env/bin/activate

#
# must run from within donkey project folder
#
if [ ! -d donkeycar ] || [ ! -f setup.py ]; then
  echo "Error: install.mac.sh must be run in the donkeycar project folder."
  exit 255
fi

# remember project folder
CWD=$(pwd)

python3 -m venv env
source env/bin/activate

# development tools
pip install pylint==2.8.3
pip install pytest pytest-cov codecov

#
# data formats
#
pip3 install --no-binary :h5py:  h5py==3.1.0
pip install pyyaml

# 
# telemetry
#
pip install paho-mqtt

#
# web server for client
#
pip install tornado requests

#
# console
#
pip install progress PrettyTable pyfiglet
pip install docopt
pip install readchar

#
# python language utilities
#
pip install mypy==0.812
pip install psutil
pip install typing_extensions

# pip controller
pip install simple-pid

#
# graphics
#
pip install imageio==2.10.5
pip install opencv-python==4.4.0.46
pip install pillow
pip install imgaug
pip install plotly
pip install moviepy

#
# data science
#
pip3 install -U --no-deps numpy==1.19.4
pip install matplotlib pandas

#
# training models
#
pip install tensorflow==2.5.3
pip install git+https://github.com/autorope/keras-vis.git
pin install pytorch=1.7.1
pip install torchvision
pip install torchaudio
pip install pytorch-lightning
pip install fastai


#
# gps
#
pip install pyserial utm pynmea2

#
# donkey ui
#
pip install kivy==2.0.0

#
# create script to launch donkey command
#
echo '#!/bin/bash' > ./donkey
echo 'source env/bin/activate' >> ./donkey
echo 'python donkeycar/management/base.py "$@"' >> ./donkey
chmod +x ./donkey
