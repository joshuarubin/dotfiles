scriptencoding utf-8

let g:lightline#bufferline#show_number=1
let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#unicode_symbols=1
let g:lightline#bufferline#filename_modifier=':t'
let g:lightline#bufferline#unnamed = '[No Name]'

let g:lightline_readonly_filetypes = ['help', 'vista_kind', 'man', 'qf', 'taskreport', 'taskinfo']
let g:lightline_filetype_mode_filetypes = ['help', 'man', 'fzf', 'vista_kind', 'qf', 'defx']
let g:lightline_no_lineinfo_filetypes = ['fzf', 'vista_kind', 'taskreport', 'taskinfo', 'defx']
let g:lightline_no_fileformat_filetypes = ['fzf', 'man', 'help', 'vista_kind', 'qf', 'taskreport', 'taskinfo', 'defx']
let g:lightline_no_filename_filetypes = ['fzf', 'vista_kind', 'qf', 'taskreport', 'taskinfo', 'defx']
let g:lightline_no_termtitle_filetypes = ['fzf', 'defx']

let g:lightline = {
      \ 'colorscheme': 'hybrid',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'crypt', 'paste', 'spell' ],
      \     [ 'git' ],
      \     [ 'filename', 'termtitle' ],
      \   ],
      \   'right': [
      \     [ 'aleerror', 'alewarn', 'lineinfo' ],
      \     [ 'fileformat' ],
      \     [ 'go', 'vista', 'filetype' ]
      \   ],
      \ },
      \ 'inactive': {
      \   'left': [
      \     [ ],
      \     [ ],
      \     [ 'fullfilename', 'termtitle' ]
      \   ],
      \   'right': [
      \     [ 'lineinfo' ],
      \     [ 'fileformat' ],
      \     [ 'go', 'filetype' ]
      \   ]
      \ },
      \ 'tabline': {
      \   'left': [
      \     [ 'buffers' ]
      \   ],
      \   'right': [
      \     [ 'lambda' ]
      \   ]
      \ },
      \ 'component': {
      \   'lambda': 'λ',
      \ },
      \ 'component_function': {
      \   'git':          'rubix#lightline#git',
      \   'filename':     'rubix#lightline#filename',
      \   'fullfilename': 'rubix#lightline#full_filename',
      \   'fileformat':   'rubix#lightline#fileformat',
      \   'filetype':     'rubix#lightline#filetype',
      \   'mode':         'rubix#lightline#mode',
      \   'crypt':        'rubix#lightline#crypt',
      \   'spell':        'rubix#lightline#spell',
      \   'paste':        'rubix#lightline#paste',
      \   'vista':        'rubix#lightline#vista',
      \   'go':           'go#statusline#Show',
      \   'termtitle':    'rubix#lightline#term_title',
      \ },
      \ 'component_expand': {
      \   'gotype':       'rubix#lightline#go_type',
      \   'lineinfo':     'rubix#lightline#line_info',
      \   'aleerror':     'rubix#lightline#aleerror',
      \   'alewarn':      'rubix#lightline#alewarn',
      \   'buffers':      'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'aleerror': 'error',
      \   'alewarn':  'warning',
      \   'buffers':  'tabsel',
      \ },
      \ 'enable': { 'statusline': 1, 'tabline': 1 },
      \ }

autocmd MyAutoCmd User ALELintPost         call lightline#update()
autocmd MyAutoCmd User CocDiagnosticChange call lightline#update()
