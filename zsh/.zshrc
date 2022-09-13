# prevent me to accidentally close the terminal
# need 3 times pressing ctrl+d before closing the session
export IGNOREEOF=3
set -o ignoreeof

# disable bell sound
unsetopt BEEP

export EDITOR=nvim
export GIT_EDITOR=nvim

alias lg="lazygit"
alias vim="nvim"
alias k=kubectl

export NVM_DIR="$HOME/.nvm"

# supports only osx for now
if [[ `uname` == "Darwin" ]]; then
	export WORKON_HOME="$HOME/.virtualenvs"
	export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
	export VIRTUALENVWRAPPER_VIRTUALENV=/opt/homebrew/bin/virtualenv
	export VIRTUALENVWRAPPER_SCRIPT=/opt/homebrew/bin/virtualenvwrapper.sh
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
}

source ~/.zsh_zplug

zvm_after_init_commands+=(setup_hook)

autoload -Uz add-zsh-hook # load add-zsh-hook with zsh (-z) and suppress aliases (-U)

source ~/.zsh_auto_env

# source personal env, ignored from git
[[ -f ~/.zsh_private ]] && source ~/.zsh_private

