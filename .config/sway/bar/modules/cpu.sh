#!/usr/bin/env bash

read _ u n s i w irq sirq _ < /proc/stat
t1=$((u+n+s+i+w+irq+sirq))
i1=$((i+w))

sleep 0.1

read _ u2 n2 s2 i2 w2 irq2 sirq2 _ < /proc/stat
t2=$((u2+n2+s2+i2+w2+irq2+sirq2))
i2=$((i2+w2))

dt=$((t2-t1))
di=$((i2-i1))
usage=$(awk "BEGIN{printf \"%.1f\",100*($dt-$di)/$dt}")

echo "{
  \"name\":\"cpu\",
  \"full_text\":\"    ${usage}%  \",
  \"background\":\"#bfbaac\",
  \"color\":\"#000000\"
}"
