#!/usr/bin/env node
'use strict';
/*
#!/bin/bash
#
# Wrapper script for git mergetool
# This requires the .gitconfig file to have
# the following (adjusting for paths):
#
#  [merge]
#    tool = merge_wrapper
#  [mergetool "merge_wrapper"]
#    cmd = $HOME/merge-wrapper.js \"$BASE\" \"$LOCAL\" \"$REMOTE\" \"$MERGED\"
#
# Save this script in your $HOME
#
# # How to create p4merge command?
# http://answers.perforce.com/articles/KB_Article/Command-line-P4Merge-on-Mac-OS-X
*/

// BASE=$1
// LOCAL=$2
// REMOTE=$3
// MERGED=$4

function createP4MergeCommand(args) {

  var result = {
    cmd: "p4merge",
    args: args
  };


  // p4merge doesn't like to be called with the extra REMOTE=3/MERGED=4
  // args so we lop them off before loading it up for images.
  if(isImage(args[0])) {
    result.args = args.slice(0, 2);
  }

  return result;
}


var path = require('path');
var spawn = require('child_process').spawn;

var diffArgs = process.argv.slice(2);

var isImage = function (path) {

  var imageExtensions = [
    "bmp", "gif", "jpg", "jpeg",
    "png", "pbm", "pgm", "ppm",
    "tiff", "xbm", "xpm"
  ];

  return imageExtensions.some(function (ext) {
    return new RegExp("." + ext + "$", 'i').test(path);
  });
};

var diffOptions = createP4MergeCommand(diffArgs);

var cmd = spawn(diffOptions.cmd, diffOptions.args);

cmd.stdout.on('data', function (data) {
  console.log(data);
});

cmd.stderr.on('data', function (data) {
  console.error(data);
});

cmd.on('close', function (code) {
  process.exit(code);
});
