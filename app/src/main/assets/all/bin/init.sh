#!/system/bin/sh
echo "### init\n"

if test -d /sdcard/luomor
  echo "### exist\n"
then
  echo "### create dir\n"
  mkdir /sdcard/luomor
fi

echo
echo "### end"
