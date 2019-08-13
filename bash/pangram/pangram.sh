#!/usr/bin/env bash
#
# Pangram Solution (exercism.io)
# Written by David Andrews

re="^[a-zA-Z]+$"
alpha="abcdefghijklmnopqrstuvwxyz"
str="${1}"

main(){
  if [[ -z "${str}" ]]; then
    echo "false"

  else
    for ((i=0; i<"${#str}"; i++)); do
      local char="${str:${i}:1}"

      # Check if the current character is part of the alphabet
      if [[ "${char}" =~ ${re} ]]; then
        # Use sed to remove the uppercase and lowercase version of the
        # character from the string alpha
        alpha="$(echo ${alpha} | sed "s/[${char^^}${char,,}]//g")"

      else
        continue
      fi
    done

    # If alpha is empty, then the string provided is a Pangram
    if [[ -z "${alpha}" ]]; then
      echo "true"

    else
      echo "false"
    fi
  fi
}

main "${@}"
