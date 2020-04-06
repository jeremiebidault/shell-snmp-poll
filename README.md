# shell-snmp-poll

SNMP poller as almost every TS monitoring tool does

Simple eq :

`(current_value - previous_value) / (current_timestamp - previous_timestamp)`

This script is just an example. Not to use in production

Put cron file ifoutoctets in /etc/cron.d/

Wait few minutes then

`# ./bitrate.sh`