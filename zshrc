##
# Source external zsh files
##
source ~/.antigen.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


##
# Antigen
##

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle marlonrichert/zsh-autocomplete
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme romkatv/powerlevel10k
antigen apply

##
# Aliases
##
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
function lsg () {
	ls -la | grep $1
}

alias nv='nvim'
alias op='xdg-open'

export PATH=$PATH:$HOME/.cargo/bin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
