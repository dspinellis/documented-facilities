#!/bin/bash
#

if [ `uname` = Linux ]
then
  lsb_release -ds 2>/dev/null || cat /etc/*-release
else
  uname -a
fi

cd /usr/share/man
for i in man* ; do
  printf "$i "
  ls $i | wc -l
done
if [ `uname` = Linux ]
then
  sudo apt-get source linux-image-$(uname -r)
  cd linux-*
  printf "4p "
  egrep -r $'^\t+.probe' drivers | wc -l
fi

echo Samples
for i in man* ; do
  echo $i
  ls $i | head
  echo
done
