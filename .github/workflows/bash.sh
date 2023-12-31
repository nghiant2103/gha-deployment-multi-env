#!/bin/bash

echo "Compare"

# IS_DIFF=$(diff <(jq -r '[paths | join(".")]' A.json) <(jq -r '[paths | join(".")]' B.json) && echo "" || echo "")

# echo "IS_DIFF: $IS_DIFF"
# # if [ -z "$IS_DIFF" ]
# # then
# #   echo "No diff"
# # else
# #   echo "Diff"
# # fi

# A=$(cat A.json)

# [[ $(diff <(echo $A | jq -r '[paths | join(".")]') <(cat B.json | jq -r '[paths | join(".")]')) ]] && echo "Diff" || echo "No diff"
# echo $?

A=$(cat A.json | jq --sort-keys | jq -r '[paths | join(".")]' | sed 's/\,//g')
B=$(cat B.json | jq --sort-keys | jq -r '[paths | join(".")]' | sed 's/\,//g')

# A=$(echo "$A" | sed 's/\,//g')
# B=$(echo "$B" | sed 's/\,//g')

if [[ $(diff <(echo "$A") <(echo "$B")) ]]
then
  echo "$(diff -c <(echo "$A") <(echo "$B"))"
  exit 1;
else
  echo "No diff"
fi
