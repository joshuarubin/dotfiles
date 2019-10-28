set background=dark

if has#colorscheme('hybrid')
  colorscheme hybrid
endif

set mouse=nv
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
highlight link CocHighlightText Visual
highlight link goSameId Visual

if exists('neovim_dot_app')
  call MacSetFont('SFMono Nerd Font', 11)
elseif has('gui_running')
  if has('gui_macvim')
    set transparency=0
    set macligatures
    set guifont=SFMono\ Nerd\ Font:h11
    set macmeta
  elseif has('gui_gtk')
    set guifont=SFMono\ Nerd\ Font\ 11
    set guioptions=agit
  endif
elseif !has('nvim')
  " different cursors for insert vs normal mode
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
endif
