#!/bin/bash
# Scan virtual hosts and update configuration files.

###############
## Variables ##
###############

# Home Directory
HOME=/home

# Configuration: Host Directory
CONF_NGINX_HOST=/etc/nginx/host.d

# Configuration: PHP FPM Pool Directory
CONF_PHP_FPM=/etc/php5/fpm/pool.d

##################
## Script Check ##
##################

# Check nginx Install

# Check PHP-FPM Install

###################################
## Remove Dangling PHP Pools ##
###################################

# Loop Through PHP Pools
for file in CONF_PHP_FPM/*.conf; do
	# Skip System Pools
	if [ $file == "www-data.conf" ]; then
		# Skip Host
		continue
	fi

	# Set User
	user=${file%.conf}

	# Check If User HTTP Directory Exists
	if [ ! -d $HOME/$user/http ]; then
		# Remove Redundant Pool
		rm $CONF_PHP_FPM/$file
	fi
fi

###############################
## Add Missing PHP Pools ##
###############################

# Handled By User Addition Script
# Nothing To See Here!

#################################
## Remove Dangling Hosts ##
#################################

# Loop Through Virtual Hosts
for file in CONF_NGINX_HOST/*.conf; do
	# Skip System Hosts
	if [ $file == ( "default.conf" || "system.conf" ) ]; then
		# Skip Host
		continue
	fi

	# Set Name
	name=${file%.conf}

	# Set User
	user=$($name | cut -d - -f 1)

	# Set Host
	host=${name#$user-}

	# Check If User Exists
	if [ ! -d $HOME/$user ]; then
		# Remove Redundant Host
		rm $CONF_NGINX_HOST/$file

		# Continue
		continue
	fi

	# Check If Host Exists
	if [ ! -d $HOME/$user/http/host/$host ]; then
		# Remove Redundant Host
		rm $CONF_NGINX_HOST/$file
	fi
fi


#############################
## Add Missing Hosts ##
#############################

# Loop Through PHP Pools To Obtain User List
for file in CONF_PHP_FPM/*.conf; do
	# Skip System Pools
	if [ $file == "www-data.conf" ]; then
		# Skip Host
		continue
	fi

	# Set User
	user=${file%.conf}

	# Check If User HTTP Directory Exists
	if [ -d $HOME/$user/http ]; then
		# Loop Through User Hosts
		for host in $HOME/$user/http/*; do
			# Check If Item Directory
			if [ -d $HOME/$user/http/$host ]; then
				# Check If Configuration Exists
				if [ ! -e CONF_NGINX_HOST/$user-$host.conf ]
					# Add Host
					# To Do
				fi
			fi
		fi
	fi
fi
