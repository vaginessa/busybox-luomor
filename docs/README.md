```shell
mount -o rw,remount /system
adb push ~/Desktop/term-init.sh /mnt/sdcard
adb shell
su
sh /mnt/sdcard/term-init.sh
```