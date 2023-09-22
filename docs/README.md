```shell
mount -o rw,remount /system
adb push ~/Desktop/term-init.sh /mnt/sdcard
adb shell
su
sh /mnt/sdcard/term-init.sh

sdb push ~/Desktop/SP8-CRON /mnt/sdcard
adb shell
su
cd /mnt/sdcard/SP8-CRON
sh Install.sh

ps -A | grep crond
crontab -l
# 可是每次执行crontab -l，系统都会报一个错误unknown uid 0. 通过id命令检查，uid为0就是root用户，为什么不能执行？
pgrep crond

cd /system/etc/init.d/
sh S99CRON-SP8

*/5 * * * * date > /data/cron-sp8.log
0 */1 * * * /system/xbin/flush
0 1 * * 1 /system/xbin/sclean

/system/etc/init.d # pgrep crond
pgrep crond
/system/etc/init.d # kill -9 14442
kill -9 14442

mount -o rw,remount /system
echo '
*/5 * * * * date > /data/cron-sp8.log
0 */1 * * * /system/xbin/flush
0 1 * * 1 /system/xbin/sclean
*/10 * * * * am start -n com.android.alarmclock/com.android.alarmclock.AlarmClock' > /system/etc/cron.d/root

sh /system/etc/init.d/S99CRON-SP8

dumpsys window displays

su -
echo "*/5 * * * * root reboot" >> /data/crontab/root
crond -b -c /data/cronjob
```