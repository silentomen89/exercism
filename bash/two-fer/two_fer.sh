#!/usr/bin/env bash
#
# Two-Fer Solution (exercism.io)
# Written by David Andrews

main(){
  # Check if a name was provided
  if [[ -n "${1}" ]]; then
    name="${1}"
  else
    name="you"
  fi

  echo "One for ${name}, one for me."
}

main "${@}"
