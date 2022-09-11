#!/usr/bin/env zsh

if ! command -v stow > /dev/null; then
	echo 'please install dependencies first by using install.sh'
	exit
fi


echo "listing directories inside dotfiles located at: $HOME/dotfiles"

pushd $HOME/dotfiles

# list all directories without .git and the dotfiles folder itself.
for dir in `find . -type d -not -path '*.git*' -not -path .`; do
	stow $(basename $dir)
	echo "configured $(basename $dir)"
done

popd

echo "done"
