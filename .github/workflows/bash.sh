#!/bin/bash

echo "Compare"

IS_DIFF=$(grep -xvFf <(jq -r '[paths | join(".")]' A.json) <(jq -r '[paths | join(".")]' B.json))
echo "IS_DIFF: $IS_DIFF"
# if [ -z "$IS_DIFF" ]
# then
#   echo "No diff"
# else
#   echo "Diff"
# fi

[[ ! -z ${IS_DIFF+x} ]] && echo "Not empty" || echo "Empty"