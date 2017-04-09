" hit <ALT-j> (maps to Ï on Mac) to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <silent> Ï <C-]>

" use <ALT-J> (maps to Í on Mac) to jump to tag in a vertical split
nnoremap <silent> Í :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>
