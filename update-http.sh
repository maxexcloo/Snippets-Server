#!/bin/bash
# Restart & reload HTTP services.

# Restart MySQL
/etc/init.d/mysql restart

# Restart PHP
/etc/init.d/php5-fpm restart

# Restart Nginx
/etc/init.d/nginx restart
