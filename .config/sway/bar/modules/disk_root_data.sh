#!/usr/bin/env bash

root=$(df -h / | awk 'NR==2 {print $3}')

echo "{
  \"name\":\"disk_root_data\",
  \"full_text\":\"$root  \",
  \"background\":\"#0E1A3A\",
  \"color\":\"#FFFFFF\"
}"
