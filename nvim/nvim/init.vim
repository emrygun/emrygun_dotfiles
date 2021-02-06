set expandtab ts=4 sw=4 ai
set number
colorscheme deus

:map <A->> :vertical res +5<CR>
:map <A-<> :vertical res -5<CR>

call plug#begin()

Plug 'scrooloose/nerdtree'

call plug#end()

let NERDTreeQuitOnOpen=1

