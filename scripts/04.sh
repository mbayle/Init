#!/bin/bash

if ! cd /etc; then
	echo "File does not exist"
	exit 1
fi

cd /etc/

if ! sha256sum -c crontab_backup.sha256; then
	mail -s "SECURITY ALERT" root@addtest.com < "Shasum report : Crontab sha256sum failed. File may possibily be corrupted."
fi

0 0 * * * root /etc/cron.daily/test.sh >/dev/null 2>&1
service cron start
