" *** General Settings ***
syntax on
set background=dark
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set hidden 
set title
set cursorline
set termguicolors
set nowrap
set scrolloff=8
set sidescrolloff=8
set colorcolumn=80
set signcolumn=yes
set confirm
set spell
set nobackup
set nowritebackup
set cmdheight=2 " Used to make messages display better
set signcolumn=yes
set updatetime=300
set redrawtime=10000
"set relativenumber

" *** Key Binds *** 

let mapleader = "\<space>"

map <leader>src :source %<cr>
map <leader>k   :nohlsearch<cr>
map <leader>ve  :edit $MYVIMRC<cr>


" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Fast addition of ; and , at end of a line
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" *** Plugins ***

" auto-install vim-plug
let data_dir = '~/.config/nvim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/gruvbox.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/fzf.vim

call plug#end()

" Colorscheme down here since it needs to be after the sourcing
colorscheme gruvbox

