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
set scrolloff=12
set sidescrolloff=8
set colorcolumn=88
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
set number
set showmode

let $BAT_THEME="gruvbox-dark"


" auto-install vim-plug
let data_dir = '~/.config/nvim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" *** Plugins ***
call plug#begin('~/.config/nvim/plugged')
"
" =======================
" Begin Coc Setup
" =======================
"

Plug 'tpope/vim-repeat'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'antoinemadec/coc-fzf',
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"
" =======================
" End Coc Setup
" =======================
"


" =======================
" Begin Builtin LSP Setup
" =======================
"
" *** Experiment with nvim-lsp builtin stuff ***
" LSP plugins
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'onsails/lspkind-nvim'

" " Snippets
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" " Color scheme
" Plug 'gruvbox-community/gruvbox'

" " tpope
" Plug 'tpope/vim-commentary'
" " Plug 'tpope/vim-fugitive'

" " Pairs
" Plug 'windwp/nvim-autopairs'

" " Git integration
" Plug 'airblade/vim-gitgutter'
"
"
" =======================
" End Builtin LSP Setup
" =======================
"

call plug#end()

"
" =======================
" Begin Coc Setup
" =======================
"

source ~/.config/nvim/plugins/navigation.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/fzf.vim

" let g:go_def_mapping_enabled = 0

" Colorscheme down here since it needs to be after the sourcing
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox


"
" =======================
" End Coc Setup
" =======================
"

"
" =======================
" Begin Builtin LSP Setup
" =======================
"
" source $HOME/.config/nvim/conf/general.vim
"
" Setup auto-pairs
" lua require('nvim-autopairs').setup{}

" $HOME/.config/nvim/lua/builtin-lsp.lua
" lua require('lsp')
"
" =======================
" End Builtin LSP Setup
" =======================
" 

