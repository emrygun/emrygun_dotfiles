" Plugin initialazitions
call plug#begin()
    "NerdTREE
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    "React and Js syntax highlight
    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript'

    "GitGutter
    Plug 'airblade/vim-gitgutter'

    "UI Elements
    Plug 'reewr/vim-monokai-phoenix'
    Plug 'itchyny/lightline.vim'

    "Auto Close
    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-surround'

    "Indent lines
    Plug 'Yggdroot/indentLine'

    "Dev Icons
    Plug 'ryanoasis/vim-devicons'

    "Snippets
    Plug 'SirVer/ultisnips'
    " Currently, es6 version of snippets is available in es6 branch only
    Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }
    Plug 'honza/vim-snippets' "optional

    "FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    "Denite
    Plug 'Shougo/denite.nvim'

    Plug 'sheerun/vim-polyglot'


call plug#end()

