#!/bin/bash

echo apt-get update -y  >> /var/log/update_script.log && apt-get upgrade -y >> /var/log/update_script.log > 03.sh
chmod 755 03.sh
sudo mv 03.sh /etc/cron.daily

echo 0 4 1 * * sudo /etc/cron.daily/03.sh >/dev/null 2>&1
service cron start
