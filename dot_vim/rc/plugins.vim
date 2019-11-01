scriptencoding utf-8

runtime rc/plugins.pre.vim

call plug#begin(rubix#config#dir('plugged'))

" enables surfing through buffers based on viewing history per window
Plug 'ton/vim-bufsurf'

Plug 'roxma/vim-hug-neovim-rpc', rubix#plug#cond(!has('nvim'))
Plug 'roxma/nvim-yarp', rubix#plug#cond(!has('nvim'))

Plug 'Shougo/neco-vim', { 'for': 'vim' }

Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install()} }
Plug 'neoclide/coc-neco'

" file browser
Plug 'Shougo/defx.nvim', { 'do': function('rubix#UpdateRemotePlugins') }
Plug 'kristijanhusak/defx-icons', { 'do': function('rubix#UpdateRemotePlugins') }
Plug 'kristijanhusak/defx-git', { 'do': function('rubix#UpdateRemotePlugins') }

" snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

Plug 'Shougo/context_filetype.vim'

" fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" dark color scheme
" colorscheme is in ~/.vim/colors with changes from w0ng/vim-hybrid
Plug 'joshuarubin/lightline-hybrid.vim'

" a light and configurable statusline/tabline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 't9md/vim-choosewin'

" shows recently used files, bookmarks and sessions
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" syntax checking
Plug 'w0rp/ale'

" displays tags in a window, ordered by scope
Plug 'liuchengxu/vista.vim'

" textobj
Plug 'kana/vim-textobj-user', { 'tag': '*' }
Plug 'reedes/vim-textobj-quote'
Plug 'reedes/vim-textobj-sentence'

" display your undo history in a graph
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-endwise'

Plug 'rhysd/git-messenger.vim'

" full featured go development environment support for vim
Plug 'fatih/vim-go', { 'for': ['go', 'gomod'] }

" a collection of language packs for vim
Plug 'sheerun/vim-polyglot'

" other language packs
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'leafgarland/typescript-vim'

" distraction-free writing in vim

" haskell

" search for selection with '*' in visual mode
Plug 'thinca/vim-visualstar'

Plug 'osyo-manga/vim-anzu'

" easy to use, file-type sensible comments
Plug 'tomtom/tcomment_vim'

Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'

" Add plugins to &runtimepath, and:
" filetype plugin indent on
" syntax enable
call plug#end()

runtime rc/plugins.post.vim
