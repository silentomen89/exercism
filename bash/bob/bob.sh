#!/usr/bin/env bash
#
# Bob Solution (exercism.io)
# Written by David Andrews

re_alpha="^[a-zA-Z?]+$"
re_upper="^[A-Z]+$"
re_digit="^[0-9]+$"
convo="${1}"

main(){
  local is_upper="yes"
  local is_empty="yes"
  local is_alpha="no"
  local last_char=""

  # Loop through each character
  for ((i=0; i < "${#convo}" ; i++)); do
    local char="${convo:${i}:1}"

    # Check to see if the character is part of the
    # alphabet, or a question mark
    if [[ "${char}" =~ ${re_alpha} ]]; then
      is_empty="no"
      last_char="${char}"

      if [[ "${char}" == "?" ]]; then
        continue
      elif [[ "${char}" =~ ${re_upper} ]]; then
        is_alpha="yes"
      else
        is_alpha="yes"
        is_upper="no"
      fi

    # Check to see if the current character is a number
    # A number counts towards a non-empty convo
    elif [[ "${char}" =~ ${re_digit} ]]; then
      is_empty="no"

    else
      continue
    fi
  done

  # If nothing is actually said
  if [[ "${is_empty}" == "yes" ]]; then
    echo "Fine. Be that way!"

  # Check if the convo ended with a question
  elif [[ "${last_char}" == "?" ]]; then

    # Check if the question was in all caps, and contains
    # a member of the alphabet
    if [[ "${is_upper}" == "yes" && "${is_alpha}" == "yes" ]]; then
      echo "Calm down, I know what I'm doing!"

    else
      echo "Sure."
    fi

  # Makes it here if the convo wasn't empty or a question
  # Check to see if the convo was all caps, and contains
  # an an alpha character
  elif [[ "${is_upper}" == "yes" && "${is_alpha}" == "yes" ]]; then
    echo "Whoa, chill out!"

  else
    echo "Whatever."
  fi
}

main "${@}"
