#!/bin/bash
#
# Wrapper script for git mergetool
# This requires the .gitconfig file to have
# the following (adjusting for paths):
#
#  [merge]
#    tool = merge_wrapper
#  [mergetool "merge_wrapper"]
#    cmd = $HOME/merge-wrapper.sh \"$BASE\" \"$LOCAL\" \"$REMOTE\" \"$MERGED\"
#
# Save this script in your $HOME

BASE=$1
LOCAL=$2
REMOTE=$3
MERGED=$4

if [[ $BASE == *.png ]]; then
  echo "Image diff..";
  CMD="p4merge \"$BASE\" \"$LOCAL\""
  echo $CMD
  eval $CMD
else
  #Finally, the default case:
  CMD="p4merge \"$BASE\" \"$LOCAL\" \"$REMOTE\" \"$MERGED\""
  #CMD="opendiff \"$BASE\" \"$LOCAL\" -ancestor \"$REMOTE\" -mergeFile \"$MERGED\""
  echo $CMD
  eval $CMD
fi
