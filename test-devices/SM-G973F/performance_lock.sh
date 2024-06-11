#!/usr/bin/env bash

# This is adapted from Skia's recipe at:
# https://github.com/google/skia/blob/e25b4472cdd9f09cd393c9c34651218507c9847b/infra/bots/recipe_modules/flavor/android.py
#
# Use that recipe to modify this for your test device. This shell script assumes Samsung Galaxy S10.
# Every device will have slightly different numbers and processes.

set -e

# Remove whitespace characters from string.
# From https://stackoverflow.com/a/3352015/1416886
trim() {
    local var="$*"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"
    echo -n "$var"
}

TARGET_DEVICE="SM-G973F"
echo "This assumes a rooted ${TARGET_DEVICE} attached via USB."
ACTUAL_DEVICE=`adb shell getprop ro.product.model`
ACTUAL_DEVICE=`trim ${ACTUAL_DEVICE}`
echo "${ACTUAL_DEVICE} detected."

if [[ "${TARGET_DEVICE}" != "${ACTUAL_DEVICE}" ]]; then
    echo "Error: the attached device ${ACTUAL_DEVICE} is not ${TARGET_DEVICE}."
    echo "Aborting. If you have another device attached, unplug it."
    exit 1
fi

# Samsung Galaxy S10 has 8 CPU Cores
# Exynos 9820 (Cortex A55), 4 x 1,90 GHz    |  (cpu0, cpu1, cpu2, cpu3)
# Exynos 9820 (Cortex A75), 2 x 2,30 GHz    |  (cpu4, cpu5)
# Exynos 9820, 2 x 2,70 GHz                 |  (cpu6, cpu7)
# Ich nehme den mit der höchsten Frequenz: cpu7
CPU_NO="0"

# Root path to CPU scaling virtual files.
# https://github.com/google/skia/blob/e25b4472cdd9f09cd393c9c34651218507c9847b/infra/bots/recipe_modules/flavor/android.py#L283
ROOT="/sys/devices/system/cpu/cpu${CPU_NO}/cpufreq"

echo
ACTUAL_CPU_FREQ=`adb shell "cat ${ROOT}/scaling_cur_freq"`
echo "Current CPU frequency: ${ACTUAL_CPU_FREQ}"
ACTUAL_GOV=`adb shell "cat /sys/devices/system/cpu/cpu${CPU_NO}/cpufreq/scaling_governor"`
echo "Current governor: ${ACTUAL_GOV}"
echo

echo "This script will set frequencies of your device's CPU and GPU."
echo; read -n 1 -s -r -p "Press any key to continue, or Ctrl-C to cancel"; echo

# requires root
adb root

# --- CPU ---

# Set userspace governor for specified cpu
# https://github.com/google/skia/blob/e25b4472cdd9f09cd393c9c34651218507c9847b/infra/bots/recipe_modules/flavor/android.py#L205

# For checking available cpu governors:
# cat /sys/devices/system/cpu/cpu7/cpufreq/scaling_available_governors
#
# performance schedutil


# #########
GOV="performance" # "userspace"-governor not available on s10
echo "Setting CPU governor to: ${GOV}"
adb shell "echo ${GOV} > /sys/devices/system/cpu/cpu${CPU_NO}/cpufreq/scaling_governor"
ACTUAL_GOV=`adb shell "cat /sys/devices/system/cpu/cpu${CPU_NO}/cpufreq/scaling_governor"`
echo "               - actual: ${ACTUAL_GOV}"
# #########

# If you want to check available frequencies:
#   cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
#
# Since we are hardcoding this script for Galaxy S10, we can just select the frequency we want.
# For cpu6 and cpu7:
# 2730000 2600000 2530000 2470000 2340000 2236000 2080000 1976000 1820000 1664000 1560000 1456000 1378000 1248000 1144000 1040000 936000 819000 728000 624000 520000
# Samsung Galaxy S10 max frequency: 2,730,000 Hz
#                             60% : 1,638,000 Hz
#                closest available: 1,664,000 Hz
#
# For cpu4 and cpu5:
# 2314000 2210000 2106000 2002000 1898000 1794000 1690000 1586000 1508000 1404000 1222000 1066000 962000 845000 754000 650000 507000
# Samsung Galaxy S10 max frequency: 2,314,000 Hz
#                             60% : 1,388,400 Hz
#                closest available: 1,404,000 Hz
#
# For cpu0, cpu1,cpu2 and cpu3:
# 1950000 1846000 1742000 1586000 1456000 1300000 1157000 1053000 949000 806000 650000 546000 442000
# Samsung Galaxy S10 max frequency: 1,950,000 Hz
#                             60% : 1,170,000 Hz
#                closest available: 1,157,000 Hz
CPU_FREQ="1157000"
MAX_FREQ="2730000"

###########
echo "Setting CPU frequency to: ${CPU_FREQ}"
# https://github.com/google/skia/blob/e25b4472cdd9f09cd393c9c34651218507c9847b/infra/bots/recipe_modules/flavor/android.py#L326
# If scaling_max_freq is lower than our attempted setting, it won't take.
# We must set min first, because if we try to set max to be less than min
# (which sometimes happens after certain devices reboot) it returns a
# perplexing permissions error.
adb shell "echo ${CPU_FREQ} > ${ROOT}/scaling_min_freq"
echo "setting minimum scaling frequency successful"
CUR_MAX_FREQ=`adb shell "cat ${ROOT}/scaling_max_freq"`
echo "current maximum scaling frequency: ${CUR_MAX_FREQ}"
#adb shell "echo 0 > ${ROOT}/scaling_max_freq"
adb shell "echo ${CPU_FREQ} > ${ROOT}/scaling_max_freq"
echo "setting maximum scaling frequency successful"
#adb shell "echo ${CPU_FREQ} > ${ROOT}/scaling_setspeed"
sleep 5
ACTUAL_CPU_FREQ=`adb shell "cat ${ROOT}/scaling_cur_freq"`
echo "                - actual: ${ACTUAL_CPU_FREQ}"

# Galaxy S10 scales other CPUs.
CPU_ONLINE=0 # 0 = turn off, 1 = turn on
max=8 # number of CPU cores
# This turns every cpu except $CPU_NO off
#adb shell "echo 1 > /sys/devices/system/cpu/cpu${CPU_NO}/online"
for ((i = 0 ; i < max ; i++ )); do
    if [[ $i -ne $CPU_NO ]]; then
        echo "Turning CPU $i to: $CPU_ONLINE"
        adb shell "echo $CPU_ONLINE > /sys/devices/system/cpu/cpu$i/online"
        ACTUAL=$(adb shell "cat /sys/devices/system/cpu/cpu$i/online")
        echo "        - actual: $ACTUAL"
    fi
done


# #################

# --- GPU ---

# # gpu frequencies:
# # cat /sys/kernel/gpu/gpu_freq_table

# # checking available governors:
# # cat /sys/kernel/gpu/gpu_available_governor
# #
# # Default Interactive Joint Static Booster Dynamic
# # 
# changing gpu governor
GPU_GOV="Booster"
adb shell "echo ${GPU_GOV} > /sys/kernel/gpu/gpu_governor"

# cat /sys/kernel/gpu/gpu_freq_table
#
# 156000 200000 260000 325000 377000 433000 572000 650000 702000
GPU_FREQ="325000"

# setting highest possible gpu frequency
adb shell "echo ${GPU_FREQ} > /sys/kernel/gpu/gpu_min_clock"
adb shell "echo ${GPU_FREQ} > /sys/kernel/gpu/gpu_max_clock"
adb shell "echo ${GPU_FREQ} > /sys/kernel/gpu/gpu_mm_min_clock"

# https://github.com/google/skia/blob/e25b4472cdd9f09cd393c9c34651218507c9847b/infra/bots/recipe_modules/flavor/android.py#L151


IDLE_TIMER="10000"

# workaround to disable DVFS
adb shell "mount -o remount,rw /"
adb shell "echo 0 > /sys/devices/platform/18500000.mali/dvfs"
adb shell "chmod 0000 /sys/devices/platform/18500000.mali/dvfs"
adb shell "chmod 0000 /sys/devices/platform/18500000.mali/dvfs_max_lock"
adb shell "chmod 0000 /sys/devices/platform/18500000.mali/dvfs_min_lock"      




# https://github.com/google/skia/blob/e25b4472cdd9f09cd393c9c34651218507c9847b/infra/bots/recipe_modules/flavor/android.py#L153
# echo "Stopping thermald"
# adb shell "stop thermald"

# kill processes that manage thermals / scaling
# adb shell "stop thermal-engine || true"
# adb shell "stop perfd || true"
# adb shell "stop vendor.thermal-engine || true"
# adb shell "stop vendor.perfd || true"

# The thermal status codes translate to specific throttling levels, which you can use for gathering data and for designing an optimal UX
# THERMAL_STATUS_NONE (0x00000000):  No throttling
# https://android.googlesource.com/platform/build/+/master/target/product/runtime_libart.mk
# https://source.android.com/docs/core/power/thermal-mitigation#thermal-api
adb shell "setprop dalvik.vm.dexopt.thermal-cutoff 0 || true"
adb shell "setprop vendor.powerhal.init 0 || true"
adb shell "setprop ctl.interface_restart android.hardware.power@1.0::IPower/default || true"




sleep 5
ACTUAL_GPU_FREQ=`adb shell "cat ${ROOT}/scaling_cur_freq"`

#adb shell "stop thermalservice"
#adb shell "stop CustomFrequencyManagerService"
#adb shell "stop IntelligentBatterySaverService"

# unrooting adb
# or otherwise adb  Performing Streamed Install is failing
echo "Unrooting adb...";
adb unroot

echo "Completed!"