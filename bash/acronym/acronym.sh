#!/usr/bin/env bash
#
# Written by David Andrews

# Regex to check against
# Anything not matching is considered a delimiter
re="^[0-9a-zA-Z']+$"

main(){
  local acronym=""
  local delim=0

  # Check if the string is empty
  if [[ -z "${1}" ]]; then
    echo "${acronym}"
    exit 1

  else
    # Loop through length of string
    for ((i=0; i<"${#1}"; i++)); do

      # delim will be 0 if a delimiter has not been hit yet
      # Second part checks to see if the current character matches
      # the regex string - e.g. checks to see if it's alphanumberic
      # or if it contains an apostrophe
      if [[ "${delim}" -eq 0 && "${1:${i}:1}" =~ ${re} ]]; then

        # Build the acronym
        acronym="$(echo ${acronym}${1:${i}:1})"
        delim=1

      # If it doesn't match the above, then it must be a delimiter
      elif [[ ! "${1:${i}:1}" =~ ${re} ]]; then
        delim=0

      # do nothing
      else
        continue
      fi
    done

    # the ^^ ensures it's uppercase
    echo "${acronym^^}"
  fi
}

main "${@}"
