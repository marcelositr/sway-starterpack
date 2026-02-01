#!/usr/bin/env bash

home=$(df -h "$HOME" | awk 'NR==2 {print $3}')

echo "{
  \"name\":\"disk_home_data\",
  \"full_text\":\"$home  \",
  \"background\":\"#0E1A3A\",
  \"color\":\"#FFFFFF\"
}"
