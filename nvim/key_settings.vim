" vertical res
:map <A->> :vertical res +10<CR>
:map <A-<> :vertical res -10<CR>

" NerdTree
" autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w

let NERDTreeMapOpenDirNode='l'
let NERDTreeMapCloseDirNode='h'

nmap <silent> <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" FZF
nnoremap <silent> <C-f> :Files<CR>

