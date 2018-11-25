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
  echo Contets of /usr/src
  ls /usr/src
  echo Contents of HOME
  ls $HOME

  cd $HOME/linux-*

  # Count supported device drivers
  printf "4p "
  egrep -r $'^\t+.probe' drivers | wc -l

  # Create man pages
  scripts/kernel-doc -man $(find -name '*.c') 2>/dev/null | sudo $HOME/split-man.pl /usr/share/man/man9 2>/dev/null
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
