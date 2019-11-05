function! chezmoi#edit(name, mods) abort
  let l:name = empty(a:name) ? bufname() : a:name
  let l:file = trim(system('chezmoi source-path ' . shellescape(l:name)))
  if v:shell_error != 0
    let l:name = fnamemodify(resolve(empty(a:name) ? bufname() : a:name), ':p')
    let l:file = trim(system('chezmoi source-path ' . shellescape(l:name)))
  endif
  if v:shell_error != 0
    throw 'chezmoi#edit: ' . l:file
  endif

  if a:mods =~# '\<tab\>'
    let l:mods = substitute(a:mods, '\<tab\>', '', 'g')
    let l:pre = 'tab split'
  else
    let l:mods = 'keepalt ' . a:mods
    let l:pre = ''
  endif

  execute l:pre

  let l:mods = s:Mods(l:mods, 'leftabove')
  execute l:mods 'edit' l:file

  if l:file =~# 'symlink_'
    setlocal nofixendofline
  endif
endfunction

function! chezmoi#diff(name, mods) abort
  let l:name = fnamemodify(resolve(empty(a:name) ? bufname() : a:name), ':p')
  let l:file = trim(system('chezmoi source-path ' . shellescape(l:name)))
  if v:shell_error != 0
    throw 'chezmoi#diff: ' . l:file
  endif

  if getftype(l:name) !=# 'file'
    throw 'chezmoi#diff: ' . l:name . ' is not a file'
  endif

  if a:mods =~# '\<tab\>'
    let l:mods = substitute(a:mods, '\<tab\>', '', 'g')
    let l:pre = 'tab split'
  else
    let l:mods = 'keepalt ' . a:mods
    let l:pre = ''
  endif

  execute l:pre

  let l:restore = s:diff_restore()
  let w:chezmoi_diff_restore = l:restore

  let l:mods = s:Mods(l:mods, 'leftabove')

  if l:name !=# fnamemodify(resolve(bufname()), ':p')
    execute l:mods 'edit' l:name
  endif

  execute l:mods 'diffsplit' fnameescape(l:file)
  let &l:readonly = &l:readonly
  redraw
  let w:chezmoi_diff_restore = l:restore
endfunction

function! s:Mods(mods, ...) abort
  let l:mods = substitute(a:mods, '\C<mods>', '', '')
  let l:mods = l:mods =~# '\S$' ? l:mods . ' ' : l:mods
  if a:0 && l:mods !~# '\<\%(aboveleft\|belowright\|leftabove\|rightbelow\|topleft\|botright\|tab\)\>'
    let l:mods = a:1 . ' ' . l:mods
  endif
  return substitute(l:mods, '\s\+', ' ', 'g')
endfunction

augroup chezmoi
  autocmd!
  autocmd BufWinLeave *
        \ if s:can_diffoff(+expand('<abuf>')) && s:diff_window_count() == 2 |
        \   call s:diffoff_all() |
        \ endif
  autocmd BufWinEnter *
        \ if s:can_diffoff(+expand('<abuf>')) && s:diff_window_count() == 1 |
        \   call s:diffoff() |
        \ endif
augroup END

function! s:can_diffoff(buf) abort
  return getwinvar(bufwinnr(a:buf), '&diff') &&
        \ !empty(getwinvar(bufwinnr(a:buf), 'chezmoi_diff_restore'))
endfunction

function! s:diff_window_count() abort
  let l:c = 0
  for l:nr in range(1, winnr('$'))
    let l:c += getwinvar(l:nr, '&diff')
  endfor
  return l:c
endfunction

function! s:diff_restore() abort
  let l:restore = 'setlocal nodiff noscrollbind'
        \ . ' scrollopt=' . &l:scrollopt
        \ . (&l:wrap ? ' wrap' : ' nowrap')
        \ . ' foldlevel=999'
        \ . ' foldmethod=' . &l:foldmethod
        \ . ' foldcolumn=' . &l:foldcolumn
        \ . ' foldlevel=' . &l:foldlevel
        \ . (&l:foldenable ? ' foldenable' : ' nofoldenable')
  if has('cursorbind')
    let l:restore .= (&l:cursorbind ? ' ' : ' no') . 'cursorbind'
  endif
  return l:restore
endfunction

function! s:diffoff_all() abort
  let l:curwin = winnr()
  for l:nr in range(1, winnr('$'))
    if getwinvar(l:nr, '&diff')
      if l:nr != winnr()
        execute l:nr . 'wincmd w'
      endif
      call s:diffoff()
    endif
  endfor
  execute l:curwin . 'wincmd w'
endfunction

function! s:diffoff() abort
  if exists('w:chezmoi_diff_restore')
    execute w:chezmoi_diff_restore
    unlet w:chezmoi_diff_restore
  else
    diffoff
  endif
endfunction
