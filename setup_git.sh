#!/bin/bash

echo "Enter your first name"
read firstName

echo "Enter your last name"
read lastName

echo "Enter your email address"
read email

echo "If you made any mistakes you can correct them
      by editing the git config.
      $ vim ~/.gitconfig"

git config --global user.name "$firstName $lastName"
git config --global user.email $email
