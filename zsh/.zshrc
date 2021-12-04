# YEET ANTIGEN
source /usr/local/share/antigen/antigen.zsh

# Load oh-my-zsh
antigen use oh-my-zsh

# Bundles 'oh joy!
antigen bundle git

# Set the theme
antigen theme af-magic

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

# User Vars
export LC_ALL=en_US.UTF-8

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
