#!/bin/csh -f

set bp1 = $1
set bn1 = $2 
#...

set file = branch.sif

set bp1plus = `echo $bp1 + 1 | bc -l`

echo "$bp1.1" pp "$bp1plus.2" >> $file

set j = 0
while ($j < $bn1)
   @ j ++
   set c = `echo $bp1 + $j | bc -l`
   set d = `echo $bp1plus + $j | bc -l`
   echo "$c.2" pp "$d.2" >> $file
end
