#!/usr/bin/env bash

sudo apt -y install software-properties-common
sudo apt update

sudo apt -y install zsh
sudo apt -y install g++ bison make
sudo apt -y install stow
sudo apt -y install unzip

# install neovim
curl -sLo ~/.local/bin/nvim https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage
chmod a+x ~/.local/bin/nvim

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

# install gvm
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# make yank work in WSL https://github.com/microsoft/WSL/issues/4440#issuecomment-638956838
curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip

unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe

chmod +x /tmp/win32yank.exe

sudo mv /tmp/win32yank.exe ~/.local/bin/

# install coursier
curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs
chmod a+x ./cs
sudo mv ./cs ~/.local/bin
cs setup -y
cs install metals
