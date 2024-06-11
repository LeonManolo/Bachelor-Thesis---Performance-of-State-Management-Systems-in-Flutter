# Lock CPU/GPU

## Identify device model

```bash
adb shell getprop ro.product.model
```

Bei einem Samsung Galaxy S10 `SM-G973F`.
## CPU Kerne ausfinden machen

```bash
adb shell ls /sys/devices/system/cpu
```

Bei einem Samsung Galaxy S10 gibt es die Ordner cpu0 bis cpu7, also insgesamt `8 Kerne`.

## GPU herausfinden


Samsung Galaxy S10 GPU: `ARM Mali-G76 MP12`




3.3 Testumgebung
Die automatisierten test werden im “Flutter run —Profile” Mode auf einem gerooteten Android bzw Samsung Galaxy S10 ausgeführt. Um die GPU/CPU Governors sowie Frequenzen dieser zu bestimmen sind root rechte erforderlich. In diesem Testaufbau werden alle CPU kerne bis auf den cpu0 deaktiviert um möglichst die Testdifferenzen zu minimieren. Das Samsung Galaxy S10 (SM-G9730F) hat insgesamt 8 CPU Kerne, vier Exynos 9820 (Cortex A55) mit 1,9 GHz, die im System mit den Namen (cpu0,cpu1, cpu2,cpu3) benannt sind. des Weiteren zwei Exynos 9820 (Cortex A75) mit 2,3 Ghz und den internen bezeichnungen (cpu4,cpu5). Als letztes noch zwei Exynos 9820 mit 2,7 GHz und den internen bezeichnungen (cpu6, cpu7). Die cpu0,cpu1,cpu2,cpu3 sind nur zusammen steuerbar sowie cpu4,cpu5 und die cpu6,cpu7. Das heißt beispielsweise das das festlegen des governors für cpu1 über `echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor` auch den governor cpu0,cpu2,cpu3 setzt genauso wie andere cpu einstellungen. Um möglichst präzise die cpus steuren zu können werden alle bis auf ein cpu deaktiviert. In diesem Fall muss es cpu0 sein da dieser zwingend Erforderlich ist um das gerät am laufen zu halten. Des weiteren wird der CPU governor auf den performance governor gesetzt um stetig auf der maximalen frequenz zu takten die in unter dem pfad '/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq' auszulesen ist. Um den cpu0 nicht zum erhitzen zu bekommen wir die maximale frequenz auf die nächste mögliche frequenz die sich bei 60% der höchsten frequenz befindet gesetzt. Die verfügbaren frequenzen gehen aus fol
gender datei hervor `/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies`. Die maximale frequenz des cpu0 liegt bei 1.950.000 wobei 60% 1.170.000 wären und die nächst mögliche frequenz ist 1.157.000.
Mögliche frequenzen (cpu0,cpu1,cpu2,cpu3):
1950000 1846000 1742000 1586000 1456000 1300000 1157000 1053000 949000 806000 650000 546000 442000

```shell
echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 1157000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
```

Alle anderen cpus werden dann deaktiviert:
```shell
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
```

Der GPU (ARM Mali-G76 MP12) läst sich leider nicht ganz so einfach setzen wie der CPU. Da hier noch Dynamic voltage and frequency scaling (DVFS) hinzukommt. DVFS sorgt dafür das die batterie geschont wird und die CPU, bzw in diesem Fall GPU leistung automatisch nach workload angepasst wird. Durch ein workaround, bzw durch verändern der berechtigungen ist es möglich das DVFS zu umgehen:
```shell
adb shell "mount -o remount,rw /"
adb shell "echo 0 > /sys/devices/platform/18500000.mali/dvfs"
adb shell "chmod 0000 /sys/devices/platform/18500000.mali/dvfs"
adb shell "chmod 0000 /sys/devices/platform/18500000.mali/dvfs_max_lock"
adb shell "chmod 0000 /sys/devices/platform/18500000.mali/dvfs_min_lock"    
```
Dies funktioniert allerdings nur wenn der app focus nicht verlassen wird.

Des weiteren gibt es noch verschiedene Android services welche die batterie optimieren und dementsprechend ausgeschaltet werden sollten sofern möglich. Dies ist aber nicht möglich auf dem Galaxy S10,

```shell
adb shell "stop thermal-engine || true"
adb shell "stop perfd || true"
adb shell "stop vendor.thermal-engine || true"
adb shell "stop vendor.perfd || true"
adb shell "setprop vendor.powerhal.init 0 || true"
adb shell "setprop ctl.interface_restart android.hardware.power@1.0::IPower/default || true"
adb shell "stop thermalservice"
adb shell "stop CustomFrequencyManagerService"
adb shell "stop IntelligentBatterySaverService"
```

