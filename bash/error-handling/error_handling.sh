#!/usr/bin/env bash
#
# Written by David Andrews

# Initializing variables
print_true="false"
print_fail="false"

main(){
  # Checking for Alice
  if [[ "${1}" == "Alice" ]]; then

    # Verify there are no additional arguments
    if [[ "${#}" -eq 1 ]]; then
      print_true="true"

    else
      print_fail="true"
    fi
 
  # Checking for string "Alice and Bob"
  elif [[ "${1}" == "Alice and Bob" ]]; then
    print_true="true"

  # Check for an empty argument
  elif [[ -z "${1}" && "${#}" -eq 1 ]]; then
    print_true="true"

  # Print failure if you reach this
  else
    print_fail="true"
  fi

  # Print 'Hello' to provided argument
  if [[ "${print_true}" == "true" ]]; then
    echo "Hello, ${1}"
    exit 0

  # Print a failure and usage
  elif [[ "${print_fail}" == "true" ]]; then
    echo "Usage: ./error_handling <greetee>"
    exit 1

  # Exit if you each this
  else
    exit 1
  fi

}

main "${@}"
