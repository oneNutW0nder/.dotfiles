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
alias kssh="kitty +kitten ssh"
alias ve="vim $HOME/.config/nvim/init.vim"
alias vez="vim $HOME/.zshrc"
alias vek="vim $HOME/.config/kitty/kitty.conf"
alias vec="vim $HOME/.config/nvim/coc-settings.json"
alias vel="vim $HOME/.config/nvim/lua/onenutw0nder/lsp.lua"
alias gdb="gdb -q"
alias work="cd $HOME/dev/metactf/content/"

# User Vars
export LC_ALL=en_US.UTF-8
export CARGO_NET_GIT_FETCH_WITH_CLI=true # Allows cargo to download things without getting mad

# Hopefully this allows us to use newer LLVM libs
# export CPPFLAGS="-I$HOME/.local/share/llvm/include -I$HOME/.local/share/llvm/include/c++/v1"
# export C_INCLUDE_PATH="-I$HOME/.local/share/llvm/include -I$HOME/.local/share/llvm/include/c++/v1"
# export CPLUS_INCLUDE_PATH="-I$HOME/.local/share/llvm/include -I$HOME/.local/share/llvm/include/c++/v1"
export CC="$HOME/.local/share/llvm/bin/clang"
export CXX="$HOME/.local/share/llvm/bin/clang++"
# export LDFLAGS="-L /Users/onenutw0nder/community/llvm-project/build_bootstraped/lib/ -Wl,-rpath,/User/onenutw0nder/community/llvm-project/build_bootstraped/lib"
# export LD="$HOME/.local/share/llvm/bin/ld.lld"
# export AR="$HOME/.local/share/llvm/bin/llvm-ar"
# export RANLIB="$HOME/.local/share/llvm/bin/llvm-ranlib"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.local/bin:$PATH" # ./local items should be top priority
export PATH="$HOME/.local/bin/wabt/wabt-1.0.29/bin:$PATH" # ./local items should be top priority
export PATH="$HOME/.local/share/llvm/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Functions

show_path() {
    echo $path | sed 's/ /\n/g'
}

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/p10k/.p10k.zsh.
[[ ! -f ~/.dotfiles/p10k/.p10k.zsh ]] || source ~/.dotfiles/p10k/.p10k.zsh
