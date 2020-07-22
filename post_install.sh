#!/bin/sh
# Output info
echo "Installing OpenSpeedTest..."
echo "After installation, please mount your pool inside the jail to /mnt/fnpool"
echo "A daily crontab has been installed to index the storage pool. If time period is not desirable, enter the jail and run "crontab -e" to modify."

# Run bash script to install
chmod +x /root/installopenspeedtest.sh
/usr/local/bin/bash /root/installopenspeedtest.sh

echo "Installing Diskover..." >> /PLUGIN_INFO
echo "After installation, please mount your pool inside the jail to /mnt/fnpool" >> /root/PLUGIN_INFO
echo "A daily crontab has been installed to index the storage pool. If time period is not desirable, enter the jail and run "crontab -e" to modify." >> /root/PLUGIN_INFO
exit