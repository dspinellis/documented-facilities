#!/bin/sh
#

for i in /usr/share/man* ; do
  echo -n "$i "
  ls $i | wc -l
done
