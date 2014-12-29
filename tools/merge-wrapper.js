#!/usr/bin/env node
'use strict';
/*
#!/bin/bash
#
# Wrapper script for git mergetool
# This requires ~/.gitconfig file to have
# the following (adjusting for paths):
#
#  [merge]
#    tool = merge_wrapper
#  [mergetool "merge_wrapper"]
#    cmd = $HOME/merge-wrapper.js \"$BASE\" \"$LOCAL\" \"$REMOTE\" \"$MERGED\"
#
# Save this script in your $HOME
#
# How to create p4merge command?
# http://answers.perforce.com/articles/KB_Article/Command-line-P4Merge-on-Mac-OS-X
*/

// BASE=$1
// LOCAL=$2
// REMOTE=$3
// MERGED=$4

var path = require('path');
var spawn = require('child_process').spawn;
var diffArgs = process.argv.slice(2);

diffArgs = {
  BASE: diffArgs[0],
  LOCAL: diffArgs[1],
  REMOTE: diffArgs[2],
  MERGED: diffArgs[3],
  REST: diffArgs.slice(4),
  ALL: diffArgs.slice(0),
};

var diffOptions;

function createP4MergeCommand(args) {

  var result = {
    cmd: "p4merge",
    args: args.ALL
  };


  // p4merge doesn't like to be called with the extra REMOTE=3/MERGED=4
  // args so we lop them off before loading it up for images.
  if(isImage(args.BASE)) {
    result.args = [args.BASE, args.LOCAL];
  }

  return result;
}

function createOpenDiffCommand(args) {

  var result = {
    cmd: "opendiff",
    args: [args.BASE, args.LOCAL]
  };

  return result;
}

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

function launch(diffOptions) {
  var cmd = spawn(diffOptions.cmd, diffOptions.args);

  cmd.stdout.on('data', function (data) {
    console.log(data);
  });

  cmd.stderr.on('data', function (data) {
    console.error(data.toString());
  });

  cmd.on('close', function (code) {
    process.exit(code);
  });
}

var diffLookup = {
  ".bmp": createP4MergeCommand,
  ".gif": createP4MergeCommand,
  ".jpg": createP4MergeCommand,
  ".jpeg": createP4MergeCommand,
  ".png": createP4MergeCommand,
  ".pbm": createP4MergeCommand,
  ".pgm": createP4MergeCommand,
  ".ppm": createP4MergeCommand,
  ".tiff": createP4MergeCommand,
  ".xbm": createP4MergeCommand,
  ".xpm": createP4MergeCommand,

// EX: using different diff command
//  ".js": createOpenDiffCommand,

  "DEFAULT": createP4MergeCommand
};

var fileExt = (path.extname(diffArgs.BASE) || '').toLowerCase();

diffOptions = (diffLookup[fileExt] || diffLookup.DEFAULT)(diffArgs);

//console.log(diffOptions);

launch(diffOptions);
