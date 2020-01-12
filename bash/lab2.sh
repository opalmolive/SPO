#!/bin/bash
mkdir -p ws/src && cd ws/src
git clone https://github.com/airalab/robonomics_comm
catkin_init_workspace && cd .. && catkin_make
wget http://bootstrap.aira.life/robonomics.sh
chmod +x ./robonomics.sh
./robonomics.sh init

