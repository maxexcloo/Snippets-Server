#!/bin/bash
# Restart & reload HTTP services.

# Clean Files
rm -rf /etc/nginx/sites-* /etc/php5/fpm/pool.d/www.*

# Restart MySQL
/etc/init.d/mysql restart

# Restart PHP
/etc/init.d/php5-fpm restart

# Restart Nginx
/etc/init.d/nginx restart
