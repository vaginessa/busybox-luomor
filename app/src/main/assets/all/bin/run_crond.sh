#!/system/bin/sh
echo "### start crond\n"

IS_RUNNING=$(ps -ef|grep crond|grep -v grep|wc -l)

if test "$IS_RUNNING" -gt 0
then
  echo "running"
  busybox crond -b -c /data/crontab
else
  echo "start crond"
  busybox crond -b -c /data/crontab
fi

echo
echo "### end"
