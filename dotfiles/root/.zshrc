if [ -r /usr/local/share/ubuntu-development/git-config-global-from-env.sh ]; then . /usr/local/share/ubuntu-development/git-config-global-from-env.sh; fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh
