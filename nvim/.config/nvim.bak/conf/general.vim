"
" ======================
" Key binds
" ======================
" 

" Nice to haves
map <leader>vr :source $MYVIMRC<cr>
map <leader>h   :nohlsearch<cr>
map <leader>ve  :edit $MYVIMRC<cr>

" Open files that don't exist
map gf :edit <cfile><cr>

" Better window switching
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" LSP Binds
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>la :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>ln :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :call LspLocationList()<CR>


"
" ======================
" Misc
" ======================
" 

" ezpz Comments
nmap <leader>gc <Plug>CommentaryLine

" Colors
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
highlight ColorColumn ctermbg=0 guibg=grey
highlight LineNr guifg=#5eacd3
