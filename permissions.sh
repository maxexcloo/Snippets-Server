#!/bin/bash
# Set permissions on each user account.

# Change To Home Directory
cd /home/

# Loop Through Users
for user in *; do
	# Set User Ownership
	chown -R $user:$user /home/$user/

	# Set User Directory Permissions
	find /home/$user/ -type d -exec chmod 0750 {} \;

	# Set User File Permissions
	find /home/$user/ -type f ! -executable -exec chmod 0640 {} \;
	
	# Set User Executable Permissions
	find /home/$user/ -type f -executable -exec chmod 0750 {} \;

	# Set User Script Permissions
	find /home/$user/ -type f -name *.sh -exec chmod 0750 {} \;
	
	# Set User Home Directory Permissions
	chmod g-w /home/$user/

	# Set User Media Directory Permissions
	chmod g-w /media/*/$user/

	# Set SSH Directory Permissions
	chmod 0700 /home/$user/.ssh

	# Set SSH File Permissions
	chmod 0600 /home/$user/.ssh/*

	# Set SSH Script Permissions
	chmod 0700 /home/$user/.ssh/validate
done

# Set Application Ownership
chown root:root /usr/bin/{ffmpeg,lame}

# Set Application Permissions
chmod 755 /usr/bin/{ffmpeg,lame}
