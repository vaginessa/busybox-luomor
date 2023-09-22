#!/system/bin/sh
echo "### start crond"

IS_RUNNING=$(ps -ef|grep crond|grep -v grep|wc -l)
echo $IS_RUNNING

if test "$IS_RUNNING" -gt 0
then
  echo "running"
else
  echo "start crond"
  busybox crond -b -c /data/crontab
fi

echo
echo "### end"
