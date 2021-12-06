# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# YEET ANTIGEN
source /usr/local/share/antigen/antigen.zsh

# Load oh-my-zsh
antigen use oh-my-zsh

# Bundles 'oh joy!
antigen bundle git

# Set the theme
# antigen theme af-magic
antigen theme romkatv/powerlevel10k

antigen apply

#export ZSH="/Users/onenutw0nder/.oh-my-zsh"


# *** BEGIN USER DATA ***
alias hack_18_pwn='docker run -it -v $PWD:/hack hacking_whale_pwndbg'
alias hack_18_gef='docker run -it -v $PWD:/hack hacking_whale_gef'
alias src='source /Users/onenutw0nder/{.zshrc,.vimrc}'
alias vim='nvim'
alias ssh="kitty +kitten ssh"
alias ve="vim $HOME/.config/nvim/init.vim"
alias vez="vim $HOME/.zshrc"
alias vek="vim $HOME/.config/kitty/kitty.conf"
alias vec="vim $HOME/.config/nvim/coc-settings.json"
alias gdb="gdb -q"

# User Vars
export LC_ALL=en_US.UTF-8

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
