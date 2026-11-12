
# we see errors on cpu 0, 1.
# but it does not crash the system.  so it is also possible to be another cpu/ or different problem that crashes system

# although only see log reports of errors with cpu0, cpu1.  so can try to focus on these


# note, cannot stop cpu0 from running system, because kernel needs.
# although could from bios, if it was supported.
#

# cannot disable CCD (entire 8 cpu carrier) in bios. for asus flow model. although can for strix.
# so instead, try to shift regular smp tasks and interrupts off cpu0, and the first carrier.
# also - disabling cpus (other than cpu0, that cannot be disabled) from first carrier - should reduce contention for L3 shared cache.
#
#    "isolcpus=0-7"
#    "irqaffinity=8-15"

set -x

echo 0 > /sys/devices/system/cpu/cpu1/online
echo 0 > /sys/devices/system/cpu/cpu2/online
echo 0 > /sys/devices/system/cpu/cpu3/online
echo 0 > /sys/devices/system/cpu/cpu4/online
echo 0 > /sys/devices/system/cpu/cpu5/online
echo 0 > /sys/devices/system/cpu/cpu6/online
echo 0 > /sys/devices/system/cpu/cpu7/online


echo 5  > /sys/devices/system/machinecheck/machinecheck0/check_interval


#echo 0 > /sys/devices/system/cpu/cpu8/online
#echo 0 > /sys/devices/system/cpu/cpu9/online
#echo 0 > /sys/devices/system/cpu/cpu10/online
#echo 0 > /sys/devices/system/cpu/cpu11/online
#echo 0 > /sys/devices/system/cpu/cpu12/online
#echo 0 > /sys/devices/system/cpu/cpu13/online
#echo 0 > /sys/devices/system/cpu/cpu14/online
#echo 0 > /sys/devices/system/cpu/cpu15/online


