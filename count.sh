#!/bin/bash
#

if [ `uname` = Linux ]
then
  lsb_release -ds 2>/dev/null || cat /etc/*-release
else
  uname -a
fi

if [ `uname` = Linux ]
then
  # Obtain DISTRIB_CODENAME
  . /etc/lsb-release
  # Obtain kernel sources
  git clone --depth=1 git://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/$DISTRIB_CODENAME linux-src
  echo Contents of current directory
  ls

  # Count supported device drivers
  printf "4p "
  egrep -r $'^\t+.probe' linux-src/drivers | wc -l

  # Create man pages
  linux-src/scripts/kernel-doc -man $(find linux-src -name '*.c') 2>/dev/null | sudo split-man.pl /usr/share/man/man9 2>/dev/null
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
