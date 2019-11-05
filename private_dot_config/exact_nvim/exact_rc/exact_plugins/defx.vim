scriptencoding utf-8

let g:defx_git#indicators = {
	\ 'Modified'  : '•',
	\ 'Staged'    : '✚',
	\ 'Untracked' : 'ᵁ',
	\ 'Renamed'   : '≫',
	\ 'Unmerged'  : '≠',
	\ 'Ignored'   : 'ⁱ',
	\ 'Deleted'   : '✖',
	\ 'Unknown'   : '⁇'
\ }

function! s:defx_toggle_tree() abort
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  endif
  return defx#do_action('drop')
endfunction

autocmd MyAutoCmd WinEnter * if &ft == 'defx' && winnr('$') == 1 | q | endif
autocmd MyAutoCmd FileType defx call s:defx_init()

function! s:defx_init()
  nnoremap <silent><buffer><expr> <cr>  <sid>defx_toggle_tree()
	nnoremap <silent><buffer><expr> l     defx#do_action('drop')
	nnoremap <silent><buffer><expr> h     defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> DD    defx#do_action('remove')
	nnoremap <silent><buffer><expr> dd    defx#do_action('move')
	nnoremap <silent><buffer><expr> yy    defx#do_action('copy')
	nnoremap <silent><buffer><expr> p     defx#do_action('paste')
	nnoremap <silent><buffer><expr> cw    defx#do_action('rename')
	nnoremap <silent><buffer><expr> r     defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> za    defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> \     defx#do_action('cd', rubix#project_dir())
	nnoremap <silent><buffer><expr> t     defx#do_action('toggle_select')
	nnoremap <silent><buffer><expr> q     defx#do_action('quit')
  nnoremap <silent><buffer><expr> <esc> defx#do_action('clear_select_all')
	nnoremap <silent><buffer><expr> <C-r> defx#do_action('redraw')
	nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
endfunction
