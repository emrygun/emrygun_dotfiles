" Basic Vim settings 
set expandtab ts=4 sw=4 ai
set number

" Resize key maps
:map <A->> :vertical res +5<CR>
:map <A-<> :vertical res -5<CR>

" Here are the compile-run-delete macro. Mapped to -> F5
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c' " For C 
exec "silent !gcc % -o %<"
exec "!time ./%<"
exec "silent !rm %<"
elseif &filetype == 'cpp' " For C++
exec "!g++ % -o %<"
exec "!time ./%<"
exec "silent !rm %<"
elseif &filetype == 'java' " For Java
exec "!javac %"
exec "!time java -cp %:p:h %:t:r"
elseif &filetype == 'sh' " For bashscript
exec "!time bash %"
elseif &filetype == 'python' " For Python
exec "!time python3.7 %"
elseif &filetype == 'html' " For HTML
exec "!firefox % &"
elseif &filetype == 'go' " For Go
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'mkd' " For Markdown
exec "!~/.vim/markdown.pl % > %.html &"
exec "!firefox %.html &"
endif
endfunc

nmap <silent> <F6> :call DissassembleGcc()<CR>
func! DissassembleGcc()
exec ":silent! %s/\s\+$//"
if &filetype == 'c' " For C 
exec "silent !gcc -S %:r.c"
exec "silent! tabnew %:r.s"
exec "silent! !rm %:r.s"
endif
endfunc

" ---------------- PLUGIN RELATED STUFF -------------------
" Plugin initialazitions
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'alvan/vim-closetag'
call plug#end()

" Plugin settings 

" NERDTREE
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w

let NERDTreeMapOpenDirNode='l'
let NERDTreeMapCloseDirNode='h'

nmap <silent> <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
" Deoplete C / C++
set completeopt=menu,menuone,longest

let g:clang_library_path='/usr/lib/llvm-7/lib'

" Deoplete settings
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-7/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/7/include/'
let g:deoplete#enable_at_startup = 1
set pumheight=10

" LightLine settings
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" CloseTag settings
" ###############################################################################
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
" ####################################################################################

" Colorscheme
colorscheme gruvbox


