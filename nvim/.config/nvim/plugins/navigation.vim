" *** Key Binds *** 
"
" This file should contain all key binds that are not 
" specifically tied to a plugin

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
