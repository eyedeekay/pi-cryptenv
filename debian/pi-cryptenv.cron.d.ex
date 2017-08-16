#
# Regular cron jobs for the pi-cryptenv package
#
0 4	* * *	root	[ -x /usr/bin/pi-cryptenv_maintenance ] && /usr/bin/pi-cryptenv_maintenance
