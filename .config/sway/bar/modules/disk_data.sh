#!/usr/bin/env bash

root=$(df -h / | awk 'NR==2 {print $3}')
home=$(df -h "$HOME" | awk 'NR==2 {print $3}')

echo "{
  \"name\":\"disk_data\",
  \"full_text\":\" $root   $home  \",
  \"background\":\"#0E1A3A\",
  \"color\":\"#FFFFFF\"
}"
