scriptencoding utf-8

execute 'runtime' 'rc/plugins.pre.vim'

call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make', 'tag': '*' }

" enables surfing through buffers based on viewing history per window
Plug 'ton/vim-bufsurf', { 'tag': '*' }

" color hex codes and color names
Plug 'chrisbra/Colorizer'

" completion
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp', { 'tag': '*' }
Plug 'prabirshrestha/asyncomplete.vim', { 'tag': '*' }
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-gocode.vim'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-emoji.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'keremc/asyncomplete-racer.vim'
Plug 'runoshun/tscompletejob'
Plug 'prabirshrestha/asyncomplete-tscompletejob.vim'
Plug 'Shougo/neco-syntax'
Plug 'prabirshrestha/asyncomplete-necosyntax.vim'
Plug 'Shougo/neco-vim',               { 'for': 'vim' }
Plug 'prabirshrestha/asyncomplete-necovim.vim'
Plug 'prabirshrestha/asyncomplete-flow.vim'
Plug 'prabirshrestha/asyncomplete-tags.vim'

" snippets
Plug 'Shougo/neosnippet'
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
Plug 'ap/vim-buftabline'

" helps you to create python code very quickly
Plug 'klen/python-mode', { 'for': 'python', 'tag': '*' }

" shows recently used files, bookmarks and sessions
Plug 'mhinz/vim-startify', { 'tag': '*' }

" syntax checking
Plug 'neomake/neomake' " for Go
Plug 'w0rp/ale', { 'tag': '*' }        " for everything else
Plug 'uber/prototool', { 'rtp': 'vim/prototool', 'tag': '*' }

" text filtering and alignment
Plug 'godlygeek/tabular', { 'on': 'Tabularize', 'tag': '*' }

" displays tags in a window, ordered by scope http://majutsushi.github.com/tagbar/
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle', 'tag': '*' }

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

" tpope
Plug 'tpope/vim-fugitive', { 'tag': '*' }
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired', { 'tag': '*' }
Plug 'tpope/vim-surround', { 'tag': '*' }
Plug 'tpope/vim-repeat', { 'tag': '*' }
Plug 'tpope/vim-eunuch', { 'tag': '*' }
Plug 'tpope/vim-endwise', { 'tag': '*' }

Plug 'gregsexton/gitv', { 'on': 'Gitv', 'tag': '*' }

" full featured go development environment support for vim
Plug 'fatih/vim-go' ", { 'for': 'go', 'tag': '*' }

" a collection of language packs for vim, forked from sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot', { 'tag': '*' }

" other language packs
Plug 'hail2u/vim-css3-syntax', { 'tag': '*' }
Plug 'chrisbra/csv.vim'
Plug 'zchee/vim-flatbuffers'
Plug 'jparise/vim-graphql', { 'tag': '*' }
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'othree/javascript-libraries-syntax.vim', { 'tag': '*' }

" use vim as $PAGER
Plug 'rkitover/vimpager', { 'do': 'make; ln -sf man man1', 'tag': '*' }

" personal wiki for vim
Plug 'vimwiki/vimwiki', { 'tag': '*' }

" distraction-free writing in vim
Plug 'junegunn/goyo.vim', { 'tag': '*' }

" matchparen for html tags
Plug 'gregsexton/MatchTag', { 'for': ['html', 'xml'] }

" haskell
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell', 'tag': '*' }
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }

" search for selection with '*' in visual mode
Plug 'thinca/vim-visualstar', { 'tag': '*' }

" easy to use, file-type sensible comments
Plug 'tomtom/tcomment_vim', { 'tag': '*' }

" show indent guides with spaces (listchars already handles tabs)
Plug 'Yggdroot/indentLine', rubix#plug#cond(!exists('g:gui_oni'), { 'tag': '*' } )

" Add plugins to &runtimepath, and:
" filetype plugin indent on
" syntax enable
call plug#end()

execute 'runtime' 'rc/plugins.post.vim'
