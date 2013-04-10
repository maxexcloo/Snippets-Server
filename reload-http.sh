#!/bin/bash
# Reload HTTP services.

# Reload MySQL
/etc/init.d/mysql reload

# Reload PHP
/etc/init.d/php5-fpm reload

# Reload Nginx
/etc/init.d/nginx reload
