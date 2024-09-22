#!/usr/bin/env bash

# args
[[ -z "$1" ]] &&\
  { echo 'please provide plaintext file as $1 positional arg'; exit 0; }

# charsets
declare -r V='aeiouy'  # vowels
declare -r C='^aeiouy' # consonants

# split file into WORDS arr (w/ no delimiter)
read -a WORDS -d '' < "$1"

# MAIN
for word in "${WORDS[@]}"; do
  echo "$word" | sed -E "{
    s/([$V][$C])([$C]+)/\1-\2/g
    t
    s/([$V])(.)/\1-\2/g
  }"
done
