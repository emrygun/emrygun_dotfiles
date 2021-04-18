" Basic Vim settings 
set expandtab ts=4 sw=4 ai
set pumheight=10
set number
set completeopt=menu,menuone,longest

" Library paths
let g:clang_library_path='/usr/lib/llvm-7/lib'

" NERDTREE
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" LightLine settings
let g:lightline = { 'colorscheme': 'one' }

" CloseTag settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Coc
let g:coc_disable_startup_warning = 1

" Colorscheme
colorscheme gruvbox


