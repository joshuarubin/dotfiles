scriptencoding utf-8

let g:lightline#bufferline#show_number=1
let g:lightline#bufferline#enable_devicons=1
let g:lightline#bufferline#unicode_symbols=1
let g:lightline#bufferline#filename_modifier=':t'
let g:lightline#bufferline#unnamed = '[No Name]'

let g:lightline_tagbar_disabled=1
let g:lightline_readonly_filetypes = ['help', 'tagbar', 'man', 'qf', 'taskreport', 'taskinfo']
let g:lightline_filetype_mode_filetypes = ['help', 'man', 'fzf', 'tagbar', 'qf', 'defx']
let g:lightline_no_lineinfo_filetypes = ['fzf', 'tagbar', 'taskreport', 'taskinfo', 'defx']
let g:lightline_no_fileformat_filetypes = ['fzf', 'man', 'help', 'tagbar', 'qf', 'taskreport', 'taskinfo', 'defx']
let g:lightline_no_filename_filetypes = ['fzf', 'tagbar', 'qf', 'taskreport', 'taskinfo', 'defx']
let g:lightline_no_termtitle_filetypes = ['fzf', 'defx']

let g:lightline = {
      \ 'colorscheme': 'hybrid',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'crypt', 'paste', 'spell' ],
      \     [ 'fugitive' ],
      \     [ 'filename', 'termtitle' ],
      \   ],
      \   'right': [
      \     [ 'aleerror', 'alewarn', 'lineinfo' ],
      \     [ 'fileformat' ],
      \     [ 'go', 'tagbar', 'filetype' ]
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
      \   'fugitive':     'rubix#lightline#fugitive',
      \   'filename':     'rubix#lightline#filename',
      \   'fullfilename': 'rubix#lightline#full_filename',
      \   'fileformat':   'rubix#lightline#fileformat',
      \   'filetype':     'rubix#lightline#filetype',
      \   'mode':         'rubix#lightline#mode',
      \   'crypt':        'rubix#lightline#crypt',
      \   'spell':        'rubix#lightline#spell',
      \   'paste':        'rubix#lightline#paste',
      \   'tagbar':       'rubix#lightline#tagbar',
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
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'enable': { 'statusline': 1, 'tabline': 1 },
      \ }

let g:tagbar_status_func = 'rubix#lightline#tagbar_status'

autocmd MyAutoCmd User ALELint             call lightline#update()
autocmd MyAutoCmd User CocDiagnosticChange call lightline#update()
