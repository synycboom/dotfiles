#!/usr/bin/env bash

brew install stow
brew install zsh
brew install neovim

# change default shell
chsh -s $(which zsh)

# install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# install fonts
rm -rf /tmp/fonts && git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts && /tmp/fonts/install.sh && rm -rf /tmp/fonts

# install lazy-git
brew install lazygit

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install