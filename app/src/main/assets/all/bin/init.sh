#!/system/bin/sh
echo "### init\n"

if test -d /sdcard/luomor
then
  echo "### exist\n"
else
  echo "### create dir\n"
  mkdir /sdcard/luomor
fi

echo
echo "### end"
