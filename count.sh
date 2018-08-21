#!/bin/sh
#

cd /usr/share/man
for i man* ; do
  printf "$i "
  ls $i | wc -l
done

echo Samples
for i in man* ; do
  echo $i
  ls $i | head
  echo
done
