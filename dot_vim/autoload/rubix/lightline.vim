scriptencoding utf-8

function! rubix#lightline#mode() abort
  if s:is_filetype_mode_filetype()
    return toupper(&filetype)
  endif

  let l:twname = rubix#lightline#twname()
  if l:twname !=# ''
    return l:twname
  endif

  return lightline#mode()
endfunction

function! rubix#lightline#crypt() abort
  if exists('+key') && !empty(&key)
    return '🔒'
  endif

  return ''
endfunction

function! rubix#lightline#blame() abort
  let l:blame = get(b:, 'coc_git_blame', '')
  return winwidth(0) >= 110 ? l:blame : ''
endfunction

function! rubix#lightline#git() abort
  let l:status = get(g:, 'coc_git_status')
  return winwidth(0) >= 70 ? l:status : ''
endfunction

function! rubix#lightline#filename() abort
  return s:filename('%:.') . s:modified() . s:readonly()
endfunction

function! rubix#lightline#full_filename() abort
  return s:filename('%:p') . s:modified() . s:readonly()
endfunction

function! rubix#lightline#fileformat() abort
  if winwidth(0) < 120
    return ''
  endif

  if s:is_no_fileformat_filetype()
    return ''
  endif

  let l:fname = expand('%:f')

  if l:fname =~# '^term:\/\/'
    return ''
  endif

  let l:status_enc = &encoding
  if &fileencoding !=# ''
    let l:status_enc = &fileencoding
  endif

  return ' ' . l:status_enc . '[' . &fileformat . WebDevIconsGetFileFormatSymbol() . ']'
endfunction

function! rubix#lightline#filetype() abort
  if winwidth(0) < 80
    return ''
  endif

  if s:is_no_fileformat_filetype()
    return ''
  endif

  if &filetype !=# ''
    return &filetype . WebDevIconsGetFileTypeSymbol() . ' '
  endif

  return ''
endfunction

function! rubix#lightline#spell() abort
  if &spell
    return &spelllang
  endif

  return ''
endfunction

function! rubix#lightline#paste() abort
  if &paste
    return 'PASTE'
  endif

  return ''
endfunction

function! rubix#lightline#vista() abort
  let l:vista = get(b:, 'vista_nearest_method_or_function', '')
  return winwidth(0) >= 90 && len(l:vista) ? ' ' . l:vista : ''
endfunction

function! rubix#lightline#term_title() abort
  call rubix#update_title()

  if s:is_no_termtitle_filetype()
    return ''
  endif

  return get(b:, 'term_title', '')
endfunction

function! rubix#lightline#status_line_info() abort
  if s:is_no_lineinfo_filetype()
    return ''
  endif

  let l:fname = expand('%:f')

  if l:fname =~# '^term:\/\/'
    return ''
  endif

  return printf('%s%.0f%% %d/%d☰ :%d',
    \   winwidth(0) < 120 ? ' ' : '',
    \   round((line('.') * 1.0) / line('$') * 100),
    \   line('.'),
    \   line('$'),
    \   col('.')
    \ )
endfunction

function! rubix#lightline#line_info() abort
  if s:is_no_lineinfo_filetype()
    return ''
  endif

  let l:fname = expand('%:f')

  if l:fname =~# '^term:\/\/'
    return ''
  endif

  return '%{rubix#lightline#status_line_info()}'
endfunction

function! rubix#lightline#go_type() abort
  if &filetype ==# 'go'
    return go#complete#GetInfo()
  endif

  return ''
endfunction

function! s:is_filetype_mode_filetype() abort
  return index(g:lightline_filetype_mode_filetypes, &filetype) >= 0
endfunction

function! s:is_no_lineinfo_filetype() abort
  return index(g:lightline_no_lineinfo_filetypes, &filetype) >= 0
endfunction

function! s:is_no_fileformat_filetype() abort
  return index(g:lightline_no_fileformat_filetypes, &filetype) >= 0
endfunction

function! s:is_no_termtitle_filetype() abort
  return index(g:lightline_no_termtitle_filetypes, &filetype) >= 0
endfunction

function! s:is_no_filename_filetype() abort
  return index(g:lightline_no_filename_filetypes, &filetype) >= 0
endfunction

function! s:is_readonly_filetype() abort
  return index(g:lightline_readonly_filetypes, &filetype) >= 0
endfunction

function! s:readonly() abort
  if s:is_readonly_filetype()
    return ''
  endif

  if &readonly
    return ' '
  endif

  return ''
endfunction

function! s:filename(fmt) abort
  if s:is_no_filename_filetype()
    return ''
  endif

  if &filetype ==# 'help'
    return expand('%:t')
  endif

  let l:fname = expand(a:fmt)

  if l:fname =~# '^term:\/\/'
    " return the 'short filename' (e.g. shell name)
    return s:filename('%:t')
  endif

  if l:fname !=# ''
    return l:fname
  endif

  return '[No Name]'
endfunction

function! s:modified() abort
  if s:is_readonly_filetype()
    return ''
  endif

  if &modified
    return '[+]'
  endif

  if &modifiable
    return ''
  endif

  return '[-]'
endfunction

function! rubix#lightline#neomakeerror() abort
  let l:res = neomake#statusline#LoclistStatus()

  let l:e_w = split(l:res)
  if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
    return matchstr(l:e_w[0], '\d\+')
  endif

  return ''
endfunction

function! rubix#lightline#aleerror() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.error ? l:counts.error : ''
endfunction

function! rubix#lightline#alewarn() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:warnings = l:counts.warning + l:counts.style_error
  return l:warnings ? l:warnings : ''
endfunction

function! rubix#lightline#neomakewarn() abort
  let l:res = neomake#statusline#LoclistStatus()

  let l:e_w = split(l:res)
  if len(l:e_w) == 2
    return matchstr(l:e_w[1], '\d\+')
  endif

  if match(l:e_w, 'W') > -1
    return matchstr(l:e_w[0], '\d\+')
  endif

  return ''
endfunction

function! rubix#lightline#twleft1() abort
  let l:parts = []

  if &filetype ==# 'taskreport' || &filetype ==# 'taskinfo'
    let l:part = b:command . (&readonly ? ' ' : '')
    if l:part !=# ''
      call add(l:parts, b:command . (&readonly ? ' ' : ''))
    endif
  endif

  if &filetype ==# 'taskreport'
    call add(l:parts, '@' . b:context)
    call add(l:parts, g:task_left_arrow . (b:hist > 1 ? ' ' . g:task_right_arrow : ''))
  endif

  if len(l:parts) == 0
    return ''
  endif

  return join(l:parts, ' ' . g:lightline.subseparator.left . ' ')
endfunction

function! rubix#lightline#twleft2() abort
  let l:parts = []

  if &filetype ==# 'taskreport' || &filetype ==# 'taskinfo'
    if b:filter !=# ''
      call add(l:parts, b:filter)
    endif
  endif

  if &filetype ==# 'taskreport'
    if b:sstring !=# ''
      call add(l:parts, b:sstring)
    endif
  endif

  if len(l:parts) == 0
    return ''
  endif

  return join(l:parts, ' ' . g:lightline.subseparator.left . ' ')
endfunction

function! rubix#lightline#twnow() abort
  if &filetype ==# 'taskreport' && b:now !=# ''
    return b:now
  endif

  return ''
endfunction

function! rubix#lightline#twname() abort
  if &filetype ==# 'taskreport'
    return 'Taskwarrior'
  endif

  if &filetype ==# 'taskinfo'
    return 'Taskinfo'
  endif

  return ''
endfunction

function! rubix#lightline#twright0() abort
  let l:parts = []

  if &filetype ==# 'taskreport'
    call add(l:parts, b:task_report_columns[taskwarrior#data#current_index()])

    if b:now !=# ''
      call add(l:parts, b:now)
    endif
  endif

  if len(l:parts) == 0
    return ''
  endif

  return join(l:parts, ' ' . g:lightline.subseparator.right . ' ')
endfunction

function! rubix#lightline#twsort() abort
  if &filetype ==# 'taskreport'
    return b:sort
  endif

  return ''
endfunction

function! rubix#lightline#twcomplete() abort
  if &filetype ==# 'taskreport'
    return b:summary[1]
  endif

  return ''
endfunction

function! rubix#lightline#twactive() abort
  if &filetype ==# 'taskreport' && b:active !=# '0'
    return b:active
  endif

  return ''
endfunction

function! rubix#lightline#twfiltered() abort
  if &filetype ==# 'taskreport'
    return b:summary[0]
  endif

  return ''
endfunction

function! rubix#lightline#twtotal() abort
  if &filetype ==# 'taskreport'
    return b:summary[2]
  endif

  return ''
endfunction
