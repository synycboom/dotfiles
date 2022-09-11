#!/usr/bin/env bash

# What OS are we running?
if command -v apt > /dev/null; then
	source $HOME/dotfiles/install.ubuntu.sh
elif [[ `uname` == "Darwin" ]]; then
  	echo 'TODO: for osx'
else
  	echo 'Unknown OS!'
fi

echo 'Finished'
