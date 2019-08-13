#!/usr/bin/env bash
#
# Raindrops Solution (exercism.io)
# Written by David Andrews

re='^[0-9]+$'

main(){
  # Verify a value was provided to the script
  if [[ -z "${1}" ]]; then
    echo "No raindrop provided."
    exit 1
  fi

  # Verify a number was provided
  if [[ ! ${1} =~ ${re} ]]; then
    echo "Raindrop is not an integer."
    exit 2
  fi

  # Loop through potential factors
  for i in 3 5 7; do
    # Enter if remainder is 0
    if [[ "$((${1} % ${i}))" -eq 0 ]]; then
      if [[ "${i}" == "3" ]]; then
        pling="Pling"

      elif [[ "${i}" == "5" ]]; then
        plang="Plang"

      else
        plong="Plong"
      fi
    fi
  done

  # If all 3 variables are empty, enter here
  if [[ -z "${pling}" && -z "${plang}" && -z "${plong}" ]]; then
    # Print the value provided
    echo "${1}"

  # If even 1 variable exists, enter here
  else
    # Print all the variables - will contain output of those that exist
    echo "${pling}${plang}${plong}"
  fi
}

main "${@}"
