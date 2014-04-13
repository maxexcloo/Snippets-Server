#!/bin/bash
# Scan daemons and restart those that have stopped.

# Change To Script Directory
cd ~/daemon/

# Loop Through Files
for file in *.sh; do
	# Find File Name
	filename=$(basename $file .sh)

	# Ignore Self
	if [ "$filename" == "daemon" ]; then
		echo "[$filename] Skipped"
		continue
	fi

	# Check For Screen Session
	if [ -e /var/run/screen/S-$(whoami)/*.$filename ]; then
		echo "[$filename] Running"
		continue
	fi

	# Execute Daemon
	echo "[$filename] Started"
	bash $file
done
