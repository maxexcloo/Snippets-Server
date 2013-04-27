#!/bin/bash
# Scan daemons and restart those that have stopped.

# Change To Script Directory
cd ~/daemon/

# Loop Through Files
for script in *.sh; do
	# Find Base Name
	base=$(basename $script)

	# Find File Name
	scriptname=${base%.*}

	# Ignore Self
	if [ "$scriptname" == "daemon" ]; then
		echo "[$scriptname] Skipped"
		continue
	fi

	# Check For Stop File
	if [ -e $scriptname.stop ]; then
		echo "[$scriptname] Blocked"
		continue
	fi

	# Check For Screen Session
	if [ -e /var/run/screen/S-$(whoami)/*.$scriptname ]; then
		echo "[$scriptname] Running"
		continue
	fi

	# Execute Daemon
	echo "[$scriptname] Started"
	bash $script
done
