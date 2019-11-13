" settings before plugins are loaded

scriptencoding utf-8

" plugin specific configuration that is too short to justify its own file

" endwise (called via snippets)
let g:endwise_no_mappings = 1

" colorizer
let g:colorizer_auto_filetype='css,html,javascript,javascript.jsx'

" hybrid
let g:hybrid_reduced_contrast = 1

" neco-ghc
let g:haskellmode_completion_ghc = 0

" vim-polyglot
let g:jsx_ext_required = 0
let g:polyglot_disabled = ['go', 'scss', 'gmpl', 'markdown', 'liquid', 'typescript']
let g:vim_json_syntax_conceal = 1

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1

" undotree
let g:undotree_SetFocusWhenToggle=1

" vimpager
let g:vimpager = {}
let g:vimpager.passthrough = 0
let g:no_cecutil_maps = 1

" startify
let g:startify_session_dir = rubix#cache#dir('sessions')
let g:startify_show_sessions = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_update_oldfiles = 1
let g:startify_session_sort = 1
let g:startify_custom_header = []

" python-mode
let g:pymode_folding  = 0
let g:pymode_lint     = 0
let g:pymode_options  = 0
let g:pymode_rope     = 0  " disable to fix conflict with jedi
let g:pymode_doc      = 0 " disable, use jedi instead
let g:pymode_python   = 'python3'

" fugitive
" delete fugitive buffers when they are left
autocmd MyAutoCmd BufReadPost fugitive://* set bufhidden=delete
" map .. to go to the parent directory
autocmd MyAutoCmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <silent> <buffer> .. :edit %:h<cr> |
  \ endif

let $GIT_SSH_COMMAND='ssh -o ControlPersist=no'

let g:neosnippet#conceal_char = 'Δ'
let g:neosnippet#enable_completed_snippet = 1

let g:coc_global_extensions = [
  \   'coc-css',
  \   'coc-emoji',
  \   'coc-git',
  \   'coc-highlight',
  \   'coc-html',
  \   'coc-json',
  \   'coc-lists',
  \   'coc-neosnippet',
  \   'coc-prettier',
  \   'coc-python',
  \   'coc-rust-analyzer',
  \   'coc-syntax',
  \   'coc-tag',
  \   'coc-tsserver',
  \   'coc-tslint-plugin',
  \   'coc-yaml',
  \ ]

let g:coc_selectmode_mapping = 0

let g:coc_filetype_map = {
  \   'yml.jinja2': 'yaml',
  \ }

let g:ansible_template_syntaxes = {
  \   '*.yml.j2': 'yaml'
  \ }

" netrw
let g:netrw_winsize = -30 " absolute width of netrw window
let g:netrw_banner = 0 " do not display info on the top of window
let g:netrw_liststyle = 3 " tree-view
let g:netrw_preview = 1 " show previews in vertical split
let g:netrw_alto = 0 " split below
let g:netrw_browse_split = 4 " use the previous window to open file
let g:netrw_sort_sequence = '[\/]$,*,\%(' . join(map(split(&suffixes, ','), 'escape(v:val, ''.*$~'')'), '\|') . '\)[*@]\=$'
let s:dotfiles = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_escape = 'substitute(escape(v:val, ".$~"), "*", ".*", "g")'
let g:netrw_list_hide =
      \ join(map(split(&wildignore, ','), '"^".' . g:netrw_escape . '. "/\\=$"'), ',') . ',^\.\.\=/\=$' .
      \ (get(g:, 'netrw_list_hide', '')[-strlen(s:dotfiles)-1:-1] ==# s:dotfiles ? ','.s:dotfiles : '')
let g:netrw_home=rubix#cache#dir('netrw')

" Ack
if executable('rg')
  let g:ackprg='rg --with-filename --no-heading --line-number --column --hidden --smart-case --follow'
elseif executable('ag')
  let g:ackprg='ag --nogroup --column --smart-case --nocolor --follow'
endif

" goyo
let g:goyo_width = '120'

" limelight
autocmd MyAutoCmd User GoyoEnter Limelight
autocmd MyAutoCmd User GoyoLeave Limelight!
let g:limelight_conceal_guifg = '#425059'
let g:limelight_default_coefficient = 0.7

" unimpaired
let g:nremap = {
\   '=': ''
\ }

" prototool
let g:prototool_format_enable = 1

" gitgutter / coc-git
highlight link GitGutterAdd          Question
highlight link GitGutterChange       CursorLineNr
highlight link GitGutterDelete       ErrorMsg
highlight link GitGutterChangeDelete Type

autocmd MyAutoCmd FileType which_key set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

let g:EasyMotion_do_mapping = 0

let g:which_key_map = {'name': '+leader'}
let g:git_messenger_no_default_mappings = 1

let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']

let g:vista_executive_for = {
  \ 'go': 'coc',
  \ 'javascript': 'coc',
  \ 'javascript.jsx': 'coc',
  \ 'python': 'coc',
\ }

" load larger plugin specific configuration
runtime! rc/plugins/*.vim
