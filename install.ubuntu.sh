#!/usr/bin/env bash

sudo apt -y install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update

sudo apt -y install zsh
sudo apt -y install g++
sudo apt -y install stow
sudo apt -y install neovim

# install vim plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# change default shell
chsh -s $(which zsh)

# install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# install fonts
rm -rf /tmp/fonts && git clone https://github.com/ryanoasis/nerd-fonts --depth=1 /tmp/fonts && /tmp/fonts/install.sh && rm -rf /tmp/fonts

# install lazy-git
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit && rm lazygit.tar.gz

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# install fd
sudo apt install fd-find
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
