#!/bin/bash

r=`snmpwalk -v 2c -c databeam 10.0.0.1 .1.3.6.1.2.1.2.2.1.16.1`
echo "`date '+%s'` $r" >> /root/shell/snmp-poll/ifoutoctets.log
