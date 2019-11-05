function! rubix#editorconfig#filetype_hook(config) abort
  if has_key(a:config, 'vim_filetype')
    let &filetype = a:config['vim_filetype']
  endif

  return 0   " Return 0 to show no error happened
 endfunction
