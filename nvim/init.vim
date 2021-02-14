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
exec "!gcc % -o %<"
exec "!time ./%<"
exec "!rm %<"
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
exec "!time python3.8 %"
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

" ---------------- PLUGIN RELATED STUFF -------------------
" Plugin initialazitions
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
call plug#end()

" Plugin settings 
let NERDTreeQuitOnOpen=1
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

colorscheme gruvbox
