#!/bin/bash
# Update, upgrade and clean system packages.

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
