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

if [[ $(diff <(cat A.json | jq -r '[paths | join(".")]') <(cat B.json | jq -r '[paths | join(".")]')) ]]
then
  echo "$(diff -c <(cat A.json | jq -r '[paths | join(".")]') <(cat B.json | jq -r '[paths | join(".")]'))"
  exit 1;
else
  echo "No diff"
fi
