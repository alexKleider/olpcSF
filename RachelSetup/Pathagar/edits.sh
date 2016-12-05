#!/bin/bash

# File: edits.sh

# Saves original files and moves over modified ones.

patdir=/home/pi/pathagar/deploy/ubuntu
setdir=/home/pi/RachelSetup/Pathagar
fab='fabric.py'
set='settings.conf'
virt='virtualhost.conf'
cp ${patdir}/${fab}  ${patdir}/${fab}.original 
cp ${patdir}/${set}  ${patdir}/${set}.original 
cp ${patdir}/${virt}  ${patdir}/${virt}.original 
cp ${setdir}/${fab}  ${patdir}/${fab}
cp ${setdir}/${set}  ${patdir}/${set}
cp ${setdir}/${virt}  ${patdir}/${virt}

PYTHONPATH="/home/pi/pathagar"
echo PYTHONPATH="/home/pi/pathagar" >> /etc/profile
