#!/usr/bin/env bash

export LC_TIME=pt_BR.UTF-8
date=$(date '+%d %b %H:%M')

echo "{
  \"name\":\"time_data\",
  \"full_text\":\"$date  \",
  \"background\":\"#0E1A3A\",
  \"color\":\"#FFFFFF\"
}"
