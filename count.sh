#!/bin/sh
#

for i in /usr/share/man* ; do
  echo -n "$i "
  ls $i | wc -l
done

echo Samples
for i in /usr/share/man* ; do
  echo -n $i
  ls $i | head
  echo
done
