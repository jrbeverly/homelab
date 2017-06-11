#!/bin/bash

# Variables
#
# Common variables for the script
localuname=`id -u -n`
PUID=`id -u $localuname`
PGID=`id -g $localuname`
thishost=`hostname`
locip=`hostname -I | awk '{print $1}'`
lannet=`hostname -I | awk '{print $1}' | sed 's/\.[0-9]*$/.0\/24/'`

# Provision
# 
# Provision the environment.

# Handle each of the images from the directories

