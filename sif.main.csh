#!/bin/csh -f

set start = $1
set mn = $2 #number of mother cells -1

set file = test.sif

set startplus = `echo $start + 1 | bc -l`
echo $start.1 pp $startplus.1 >> $file

set i = 0
while ($i < $mn)
  @ i++
  set a = `echo $start + $i | bc -l`
  set b = `echo $startplus + $i | bc -l`
  echo "$a.1" pp "$b.1" >> $file
end

