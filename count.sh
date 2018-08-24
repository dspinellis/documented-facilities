#!/bin/sh
#

if [ `uname` = Linux ]
then
  lsb_release -ds 2>/dev/null || cat /etc/*-release
else
  uname
fi

cd /usr/share/man
for i in man* ; do
  printf "$i "
  ls $i | wc -l
done

echo Samples
for i in man* ; do
  echo $i
  ls $i | head
  echo
done
