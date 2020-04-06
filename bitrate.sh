#!/bin/bash

pt=
pv=
t=
v=

max=4294967295 # max 32bits (ex : ifOutOctets)
#max=18446744073709551615 # max 64 bits (ex : ifHCOutOctets)

while read -r line; do

    t=$(grep -Eo '^[0-9]+' <<< $line)
    v=$(grep -Eo '[0-9]+$' <<< $line)

    if [ ! -z $t ] && [ ! -z $v ]; then

        if [ ! -z $pt ] && [ ! -z $pv ]; then

            unit="Kbits/s"
            divider=1000 # 1000000 for Mbits, 1000 for Kbits, 1 for bits

            ct=$(($t - $pt))
            [[ $v -lt $pv ]] && cv=$(($v - $pv + $max)) || cv=$(($v - $pv))

            # initial value is displayed in byte so we multiply by 8
            r=$(($cv * 8 / $ct / $divider))

            echo "`date -d "@$t" +%c` : $r $unit during the last $ct seconds"

        fi

        pt=$t
        pv=$v

    fi

done < ifoutoctets.log
