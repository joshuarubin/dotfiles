scriptencoding utf-8

set synmaxcol=512
syntax sync minlines=256

set list

set listchars=tab:\│\ ,trail:•,precedes:❮,nbsp:.
set fillchars=vert:│,fold:-

set laststatus=2 " always show the statusline
set title
set linebreak " wrap lines at convenient points
let &showbreak='=>'
set whichwrap+=<,>,[,]

if exists('+breakindent')
  set breakindent
  set wrap
else
  set nowrap
endif

set shortmess+=Ic
set t_vb=
set novisualbell " no sounds

set wildmenu " show list for autocomplete
set wildmode=list:longest,full

if v:version > 703 || v:version == 703 && has('patch072')
  set wildignorecase
endif

" stuff to ignore when tab completing
set wildignore+=
      \*.o,
      \*.obj,
      \*~,
      \*.so,
      \*.swp,
      \*.DS_Store

set history=1000 " store lots of :cmdline history
set showfulltag
set completeopt=noinsert,menuone,noselect
set nospell
set splitright
set splitbelow
set diffopt+=vertical
set winheight=10
set winminheight=1
set ttyfast " assume fast terminal connection
set lazyredraw
set showtabline=2

if has('conceal')
  set conceallevel=2
  set concealcursor=niv
  set listchars+=conceal:Δ
endif

set noshowmode

set ruler
set noshowcmd                   " prevent flicker, lightline shows info anyway
set number                      " line numbers are good
set scrolloff=8                 " start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set scrolljump=3
set numberwidth=1
set signcolumn=yes

autocmd MyAutoCmd BufEnter * call rubix#update_title()
autocmd MyAutoCmd InsertEnter * setlocal nohlsearch
autocmd MyAutoCmd InsertLeave * setlocal hlsearch

if has('nvim')
  autocmd MyAutoCmd TermOpen * setlocal nolist nonumber norelativenumber sidescrolloff=0 winfixheight signcolumn=no
elseif has('terminal')
  autocmd MyAutoCmd TerminalOpen * setlocal nolist nonumber norelativenumber sidescrolloff=0 winfixheight signcolumn=no
endif

autocmd MyAutoCmd CursorHold * silent call CocActionAsync('highlight')
autocmd MyAutoCmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd MyAutoCmd BufReadPost fugitive://* let b:ale_enabled=0
