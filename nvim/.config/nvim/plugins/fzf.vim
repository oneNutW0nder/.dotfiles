" Enable window preview
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" The --preivew option here does not get applied but whatever 
let $FZF_DEFAULT_OPTS = "--layout=reverse --info=inline --preview 'bat --color=always --theme=gruvbox-dark'"

" Customise the Files command to use rg which respects .gitignore files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden' }), <bang>0))

nmap <C-p> :Files<cr>

