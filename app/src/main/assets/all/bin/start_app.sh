#!/system/bin/sh
echo "### start app"

IS_RUNNING=$(dumpsys window | grep mCurrentFocus|grep com.luomor.keepalive|wc -l)

if test "$IS_RUNNING" -gt 0
then
  echo "running"
else
  echo "start app"
  am start -n "com.luomor.keepalive/io.dcloud.PandoraEntry" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER
fi

echo
echo "### end"
