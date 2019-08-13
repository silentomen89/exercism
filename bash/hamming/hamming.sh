#!/usr/bin/env bash
#
# Written by David Andrews

main(){
  local ham_dist=0

  # Check for no input, or just one string. 
  if [[ "${#}" -eq 0 || "${#}" -eq 1 ]]; then
    echo "Usage: hamming.sh <string1> <string2>"
    exit 1

  # Check if the variables are identical
  elif [[ "${1}" == "${2}" ]]; then
    echo "${ham_dist}"
    exit 0

  # Mismatched lengths, unable to compare
  elif [[ "${#1}" -ne "${#2}" ]]; then

    if [[ "${#1}" -eq 0 ]]; then
      echo "left strand must not be empty"

    elif [[ "${#2}" -eq 0 ]]; then
      echo "right strand must not be empty"

    else
      echo "left and right strands must be of equal length"
    fi

    exit 1

  # Else they're the same length, so calculate the hamming distance
  else

    # Loop through each character in the string
    for ((i=0 ; i<"${#1}"; i++)); do

      # if the current characters are not identical, increment distance
      if [[ "${1:${i}:1}" != "${2:${i}:1}" ]]; then
        ham_dist="$((ham_dist + 1))"
      fi

    done

    echo "${ham_dist}"
    exit 0
  fi
}

main "${@}"
