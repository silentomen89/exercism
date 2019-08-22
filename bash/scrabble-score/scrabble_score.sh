#!/usr/bin/env bash
#
# Scrabble Score Solution (exercism.io)
# Written by David Andrews

# Setup regex variables for each score category
# Also initializing total and storing the string provided
re_one="[aAeEiIoOuUlLnNrRsStT]"
re_two="[dDgG]"
re_three="[bBcCmMpP]"
re_four="[fFhHvVwWyY]"
re_five="[kK]"
re_eight="[jJxX]"
re_ten="[qQzZ]"
total="0"
str="${1}"

main(){
  for ((i=0; i < "${#str}"; i++)); do
    local char="${str:${i}:1}"

    if [[ "${char}" =~ ${re_one} ]]; then
      total="$((total + 1))"
    
    elif [[ "${char}" =~ ${re_two} ]]; then
      total="$((total + 2))"

    elif [[ "${char}" =~ ${re_three} ]]; then
      total="$((total + 3))"

    elif [[ "${char}" =~ ${re_four} ]]; then
      total="$((total + 4))"

    elif [[ "${char}" =~ ${re_five} ]]; then
      total="$((total + 5))"

    elif [[ "${char}" =~ ${re_eight} ]]; then
      total="$((total + 8))"

    elif [[ "${char}" =~ ${re_ten} ]]; then
      total="$((total + 10))"

    else
      continue
    fi
  done

  # Print the total
  echo "${total}"
}

main "${@}"
