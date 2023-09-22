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

busybox crontab -l

crontab -c /etc/crontabs/ /etc/crontabs/root
#change the default root_crontab_file to /etc/crontabs/root

crond -c /etc/crontabs/
#change crond directory

su -
#echo "*/5 * * * * root reboot" >> /data/crontab/root
mkdir /data/crontab/
echo "*/5 * * * * root sh /sdcard/luomor/start_app.sh" >> /data/crontab/root
echo "*/5 * * * * date > /data/cron.log" >> /data/crontab/root
cat /data/crontab/root
*/5 * * * * root sh /sdcard/luomor/start_app.sh
busybox crond -b -c /data/crontab
busybox crontab -c /data/crontab /data/crontab/root

su -
mkdir /data/cronjob
ls /data/cronjob
busybox crond -b -c /data/cronjob
```

```
Requirements

Root access
Busybox : for 'crond' service
/system/etc/init.d folder to start 'crond' service at boot
Creating cronjob Create the cronjob file in directory /data/crontab/ with filename root. Write your cronjob inside the file 'root'. Set executable permissions for the file 'root'

Test without rebooting Now open any terminal emulator in device and run the following commands..

su -
crond -b -c /data/cronjob
Now the crond service will start, to check type...

top | grep crond
Start crond at boot

mount system partition in read write :

su -

mount -o remount,rw /system

Create a file 99my_daemon at /system/etc/init.d with executable permission and enter the following lines

crond -b -c /data/crond

Close writing the /system partition

mount -o remount,rw /system

And reboot

Example of cron filename root

*/15 * * * * reboot
```