#!/system/bin/sh
echo "### init\n"

if test -d /sdcard/luomor
then
  echo "### exist /sdcard/luomor\n"
else
  echo "### create dir /sdcard/luomor\n"
  mkdir /sdcard/luomor
fi

echo
echo "### end"
