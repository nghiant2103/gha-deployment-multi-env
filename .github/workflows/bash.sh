#!/bin/bash

echo "Compare"

IS_DIFF=$(diff <(jq -r '[paths | join(".")]' A.json) <(jq -r '[paths | join(".")]' B.json) && echo "" || echo "")

echo "IS_DIFF: $IS_DIFF"
# # if [ -z "$IS_DIFF" ]
# # then
# #   echo "No diff"
# # else
# #   echo "Diff"
# # fi

[[ $(diff <(jq -r '[paths | join(".")]' A.json) <(jq -r '[paths | join(".")]' B.json)) ]] && echo "Not empty" || echo "Empty"
echo $?