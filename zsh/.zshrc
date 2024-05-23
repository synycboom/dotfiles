# prevent me to accidentally close the terminal
# need 3 times pressing ctrl+d before closing the session
export IGNOREEOF=3
set -o ignoreeof

# autocd
setopt auto_cd

# disable bell sound
unsetopt BEEP

export EDITOR=nvim
export GIT_EDITOR=nvim

alias lg="lazygit"
alias vim="nvim"
alias k=kubectl
alias ls="ls -G"

export NVM_DIR="$HOME/.nvm"

if [[ -d "$HOME/.local/bin" ]]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# all plugins that needs key-binding need to be initialized inside this function after zsh-vi-mode
function setup_hook() {
	# key-binding for fzf
	[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

	# kubectl auto-completion
	[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

	# setup nvm
	[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
	[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

	# setup gvm
	[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

	# setup virtualenvwrapper
	[[ $VIRTUALENVWRAPPER_SCRIPT ]] && source $VIRTUALENVWRAPPER_SCRIPT

  # setup coursier path
  COURSIER_BIN="$HOME/Library/Application Support/Coursier/bin"
  if [[ -d "$COURSIER_BIN" ]]; then
    export PATH="$PATH:$COURSIER_BIN"
    source ~/.zsh_cs
  fi
}

source ~/.zsh_zplug

zvm_after_init_commands+=(setup_hook)

source ~/.zsh_auto_env
source ~/.zsh_tmux

# source personal env, ignored from git
[[ -f ~/.zsh_private ]] && source ~/.zsh_private
