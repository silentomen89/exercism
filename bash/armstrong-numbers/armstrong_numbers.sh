#!/usr/bin/env bash
#
# Written by David Andrews

num="${1}"
num_len="${#num}"

main(){
  local val="0"

  # Loops through each digit and adds up the value
  # of the current digit to the power of the length of the number
  for ((i=0; i<"${num_len}"; i++)); do
    val=$((val + (${num:${i}:1}**${num_len})))  
  done

  if [[ "${num}" == "${val}" ]]; then
    echo "true"

  else
    echo "false"
  fi
}

main "${@}"
