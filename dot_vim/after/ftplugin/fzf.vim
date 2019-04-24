" fzf
if has('nvim') || has('terminal')
  " ensure <c-j> and <c-k> work properly within fzf window
  tnoremap <buffer> <c-j> <c-j>
  tnoremap <buffer> <c-k> <c-k>
  " <c-x> shouldn't open term here, fzf will open a vertical split if used
  tnoremap <buffer> <c-x> <c-x>
  tnoremap <buffer> <c-v> <c-v>
endif
