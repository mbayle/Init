#!/bin/bash

echo apt-get update -y  >> /var/log/update_script.log && apt-get upgrade -y >> /var/log/update_script.log > 02.sh
chmod 755 02.sh
sudo mv 02.sh /etc/cron.daily

echo 0 4 1 * * sudo /etc/cron.daily/02.sh >/dev/null 2>&1
service cron start
