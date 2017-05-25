#!/bin/sh
qemu-system-x86_64  -smp 2 -cpu phenom -soundhw es1370 -k de -m 1024 -localtime -boot d -cdrom dvecafe.iso -net nic,vlan=1,macaddr=00:c9:29:b8:7c:ee -net tap,vlan=1,script="qemu-ifup2" -name "Linux x86" $*
