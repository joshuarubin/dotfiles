set background=dark

if has#colorscheme('hybrid')
  colorscheme hybrid
endif

set mouse=a " enable mouse usage (all modes)
set mousehide

if !has('nvim') && has('mouse_sgr')
  set ttymouse=sgr
endif

if !has('nvim')
  set t_ut= " make vim flicker less
endif

augroup HighlightTODO
  " ensure any instance TODO or FIXME is highlighted as an Error in any filetype
  autocmd!
  autocmd WinEnter,VimEnter * :silent! call matchadd('Error', 'TODO', -1)
  autocmd WinEnter,VimEnter * :silent! call matchadd('Error', 'FIXME', -1)
augroup END

highlight Comment gui=italic cterm=italic

if exists('neovim_dot_app')
  call MacSetFont('Hasklig', 11)
elseif has('gui_running')
  if has('gui_macvim')
    set transparency=0
    set macligatures
    set guifont=Hasklig:h12
    set macmeta
  elseif has('gui_gtk')
    set guifont=Inconsolata\ for\ Powerline\ Medium\ 10
  endif
elseif !has('nvim')
  " different cursors for insert vs normal mode
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif
