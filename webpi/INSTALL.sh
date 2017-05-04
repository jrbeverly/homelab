#!/bin/sh
set -ex
cd /tmp/

ADDRESS=192.168.0.15
PASSWORD='sethere'

# Setup on external machine (ssh into it)

# Keygen
#
# Generating the key for the raspiberry pi
ssh-keygen

# Users
#
# Setting up machine users 
ssh pi:raspberry@$ADDRESS 'bash .. (the below)'
useradd jrbeverly 
adduser jrbeverly sudo
useradd -m -G adm,dialout,cdrom,sudo,audio,video,plugdev,users,input,netdev,gpio,i2c,spi pi_admin

# Raspi Configuration
#
# Configuring the raspberry pi
ssh jrbeverly:$PASSWORD@$ADDRESS 'bash .. (the below)'
apt-get update -y
apt-get upgrade -y

# raspi-config notes (non-interactive)
# Boot to Network
# Update Locale
# Update timezone
# Update Wi-Fi country
# Set hostname to webpi
# Set memory split
# Reboot machine

# Delete the pi user
deluser --remove-all-files pi

# SSH Securing
#
# Securing the SSH server
rm /etc/ssh/ssh_host_* && sudo dpkg-reconfigure openssh-server
#nano /etc/ssh/sshd_config
#PasswordAuthentication 'no''
#PermitRootLogin 'no'

# Protection
#
# Setting up protections for the system.
apt-get install -y fail2ban iptables

#iptables-restore < /etc/iptables.firewall.rules
#iptables -L

# Up-to-Date
#
#
apt-get upgrade -y
apt-get dist-upgrade -y

apt-get install rpi-update -y
rpi-update