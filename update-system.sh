#!/bin/bash
# Update, upgrade and clean system packages.

# Root Clean
#rm -rf ~/*; rm -rf ~/.??*; cp /etc/skel/.??* ~; sed -i "s/^umask o=/#umask o=/g" ~/.bashrc

# Update Package Lists
apt-get update

# Upgrade System Packages
apt-get upgrade

# Remove Redundant Packages
apt-get autoremove

# Clean Package Cache
apt-get clean

# Clean HTTP Files
rm -rf /etc/nginx/sites-* /etc/php5/fpm/pool.d/www.*

# Clean Lost & Found
rm -rf /lost+found/ /home/lost+found/ /media/*/lost+found/ /mnt/*/lost+found/
