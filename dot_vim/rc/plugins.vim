scriptencoding utf-8

execute 'runtime' 'rc/plugins.pre.vim'

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make', 'tag': '*' }

" enables surfing through buffers based on viewing history per window
Plug 'ton/vim-bufsurf', { 'tag': '*' }

" color hex codes and color names
Plug 'chrisbra/Colorizer'

Plug 'roxma/vim-hug-neovim-rpc', rubix#plug#cond(!has('nvim'))
Plug 'roxma/nvim-yarp', rubix#plug#cond(!has('nvim'))

Plug 'Shougo/neco-vim', { 'for': 'vim' }

Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': { -> coc#util#install()} }
Plug 'neoclide/coc-neco'

Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

" file browser
Plug 'Shougo/defx.nvim', { 'do': function('rubix#UpdateRemotePlugins') }
Plug 'kristijanhusak/defx-icons', { 'do': function('rubix#UpdateRemotePlugins') }
Plug 'kristijanhusak/defx-git', { 'do': function('rubix#UpdateRemotePlugins') }

" snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets', { 'tag': '*' }

Plug 'Shougo/context_filetype.vim'

" fuzzy finder
Plug 'junegunn/fzf', { 'tag': '*' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim', { 'tag': '*' }

" dark color scheme
" colorscheme is in ~/.vim/colors with changes from w0ng/vim-hybrid
Plug 'joshuarubin/lightline-hybrid.vim'

" a light and configurable statusline/tabline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 't9md/vim-choosewin'

" helps you to create python code very quickly
Plug 'klen/python-mode', { 'for': 'python', 'tag': '*' }

" shows recently used files, bookmarks and sessions
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons', { 'tag': '*' }

" syntax checking
Plug 'w0rp/ale'
Plug 'uber/prototool', { 'rtp': 'vim/prototool', 'tag': '*' }

Plug 'junegunn/vim-easy-align'

" displays tags in a window, ordered by scope
Plug 'liuchengxu/vista.vim'

" textobj
Plug 'kana/vim-textobj-user', { 'tag': '*' }
Plug 'kana/vim-textobj-indent', { 'tag': '*' }
Plug 'kana/vim-textobj-entire', { 'tag': '*' }
Plug 'lucapette/vim-textobj-underscore'
Plug 'reedes/vim-textobj-quote', { 'tag': '*' }
Plug 'reedes/vim-textobj-sentence', { 'tag': '*' }
Plug 'wellle/targets.vim', { 'tag': '*' }

Plug 'christoomey/vim-tmux-navigator',     rubix#plug#cond(exists('$TMUX'), { 'tag': '*' })
Plug 'tmux-plugins/vim-tmux-focus-events', rubix#plug#cond(exists('$TMUX'), { 'tag': '*' })

" display your undo history in a graph
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle', 'tag': '*' }


Plug 'liuchengxu/vim-which-key'

" tpope
Plug 'tpope/vim-fugitive', { 'tag': '*' }
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired', { 'tag': '*' }
Plug 'tpope/vim-surround', { 'tag': '*' }
Plug 'tpope/vim-repeat', { 'tag': '*' }
Plug 'tpope/vim-eunuch', { 'tag': '*' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rsi'

Plug 'gregsexton/gitv', { 'on': 'Gitv', 'tag': '*' }
Plug 'lambdalisue/suda.vim'

Plug 'rhysd/git-messenger.vim'

" full featured go development environment support for vim
Plug 'fatih/vim-go', { 'for': ['go', 'gomod'], 'tag': '*' }

" a collection of language packs for vim
Plug 'sheerun/vim-polyglot', { 'tag': '*' }

" other language packs
Plug 'hail2u/vim-css3-syntax', { 'tag': '*' }
Plug 'chrisbra/csv.vim'
Plug 'zchee/vim-flatbuffers'
Plug 'jparise/vim-graphql', { 'tag': '*' }
Plug 'othree/javascript-libraries-syntax.vim', { 'tag': '*' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" distraction-free writing in vim
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" haskell
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell', 'tag': '*' }
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }

" search for selection with '*' in visual mode
Plug 'thinca/vim-visualstar', { 'tag': '*' }

Plug 'osyo-manga/vim-anzu'
Plug 'kshenoy/vim-signature'

" easy to use, file-type sensible comments
Plug 'tomtom/tcomment_vim', { 'tag': '*' }

Plug 'easymotion/vim-easymotion'

" Add plugins to &runtimepath, and:
" filetype plugin indent on
" syntax enable
call plug#end()

execute 'runtime' 'rc/plugins.post.vim'
