" *** General Settings ***
syntax on
set background=dark
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
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
set mouse=a
set nobackup
set nowritebackup
set cmdheight=2 " Used to make messages display better
set updatetime=300
set redrawtime=10000
set relativenumber
" set number

" *** Key Binds *** 

let mapleader = "\<space>"

map <leader>vr :source %<cr>
map <leader>h   :nohlsearch<cr>
map <leader>ve  :edit $MYVIMRC<cr>

" Better window operations
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Fix Y to make it behave (:h y)
map Y y$

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
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/repeat.vim
" source ~/.config/nvim/plugins/smooth-scroll.vim

call plug#end()

" Colorscheme down here since it needs to be after the sourcing
colorscheme gruvbox

