#!/usr/bin/env bash

root=$(df -h / | awk 'NR==2 {print $3}')
home=$(df -h "$HOME" | awk 'NR==2 {print $3}')

echo "{
  \"name\":\"disk\",
  \"full_text\":\"    $root     $home  \",
  \"background\":\"#bfbaac\",
  \"color\":\"#000000\"
}"
