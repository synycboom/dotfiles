#!/usr/bin/env bash

brew install stow
brew install zsh
brew install neovim

# create local bin
mkdir -p ~/.local/bin

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# change default shell
chsh -s $(which zsh)

# install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# install fonts
rm -rf /tmp/fonts && git clone https://github.com/ryanoasis/nerd-fonts --depth=1 /tmp/fonts && /tmp/fonts/install.sh && rm -rf /tmp/fonts

# install lazy-git
brew install lazygit

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# install fd
brew install fd

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# install gvm
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# install python3
brew install python

# install black formatter for python
pip3 install black

# setup coursier for Scala
# if calling scala and the command is not found, you should check the ~/.zprofile $PATH
# in some case coursier setup the path with whitespace incorrectly
curl -fL https://github.com/VirtusLab/coursier-m1/releases/latest/download/cs-aarch64-apple-darwin.gz | gzip -d > cs
chmod a+x ./cs
sudo mv ./cs ~/.local/bin
cs setup -y
cs install metals
