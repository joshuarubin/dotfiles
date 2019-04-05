function! s:get_last_mode(win) abort
  let l:buf = winbufnr(a:win)
  let l:last_mode = getbufvar(l:buf, 'last_mode', {})
  return get(l:last_mode, a:win, '')
endfunction

function! s:set_last_mode(win, mode) abort
  let l:buf = winbufnr(a:win)

  if getbufvar(l:buf, '&buftype') !=# 'terminal'
    return
  endif

  let l:last_mode = getbufvar(l:buf, 'last_mode', {})
  let l:last_mode[a:win] = a:mode
  call setbufvar(l:buf, 'last_mode', l:last_mode)
endfunction

function! rubix#terminal#save_mode() abort
  let l:win = winnr()
  if s:get_last_mode(l:win) ==# ''
    call s:set_last_mode(l:win, mode())
  endif

  return "\<c-\>\<c-n>"
endfunction

function! s:start_insert_term() abort
  if has('nvim')
    startinsert
  endif

  if has('terminal') && mode() !=# 't'
    execute 'normal i'
  endif
endfunction

let s:term = {
  \   'buf': 0,
  \   'height': 10,
  \ }

function! rubix#terminal#toggle() abort
  " user is in the terminal, close it and return to the previous location
  if s:term.buf == bufnr('')
    let l:win = winnr()
    if l:win == 1 && winnr('$') == 1
      return
    endif
    let s:term.height = winheight(l:win)
    wincmd p
    execute l:win.'close'
    return
  endif

  " if the terminal window is already shown, switch to it
  let l:win = bufwinnr(s:term.buf)
  if s:term.buf != 0 && l:win != -1
    execute l:win.'wincmd w'
    call s:start_insert_term()
    return
  endif

  " create the window and switch to it
  execute 'botright '.s:term.height.'new'

  " if the terminal buffer exists show it in the window
  if s:term.buf != 0 && bufexists(s:term.buf)
    let l:buf = bufnr('')
    execute 'buffer '.s:term.buf
    execute 'bwipeout '.l:buf
    call s:start_insert_term()
    return
  endif

  " create a new terminal buffer
  if has('nvim')
    call termopen(&shell)
  endif

  if has('terminal')
    terminal ++curwin
  endif

  setlocal bufhidden=hide winfixwidth winfixheight
  let s:term.buf = bufnr('')
  call s:start_insert_term()
endfunction

function! s:remove_last_mode(win) abort
  let l:buf = winbufnr(a:win)

  if getbufvar(l:buf, '&buftype') !=# 'terminal'
    return ''
  endif

  let l:last_mode = getbufvar(l:buf, 'last_mode', {})

  if get(l:last_mode, a:win, '') ==# ''
    return ''
  endif

  let l:ret = remove(l:last_mode, a:win)
  call setbufvar(l:buf, 'last_mode', l:last_mode)
  return l:ret
endfunction

function! rubix#terminal#restore_mode() abort
  let l:win = winnr()
  let l:mode = s:remove_last_mode(l:win)

  if l:mode ==# 't'
    call s:start_insert_term()
  endif
endfunction
