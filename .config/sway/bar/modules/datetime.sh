#!/usr/bin/env bash

export LC_TIME=pt_BR.UTF-8
date=$(date '+%d %b %H:%M')

echo "{
  \"name\":\"time\",
  \"full_text\":\"    $date  \",
  \"background\":\"#bfbaac\",
  \"color\":\"#000000\"
}"
