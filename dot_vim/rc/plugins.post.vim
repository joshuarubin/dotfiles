scriptencoding utf-8

" settings after plugins are loaded

" install missing plugins on start
autocmd MyAutoCmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | quit
  \| endif
  \| call defx#custom#option('_', {
        \ 'winwidth': 30,
        \ 'split': 'vertical',
        \ 'direction': 'leftabove',
        \ 'show_ignored_files': 0,
        \ 'buffer_name': '',
        \ 'toggle': 1,
        \ 'resume': 1,
        \ 'columns': 'indent:mark:git:icons:filename'
        \ })
  \| call defx#custom#column('mark', {
        \ 'readonly_icon': '',
        \ 'selected_icon': '',
        \ })
  \| call defx#custom#column('mark', {
        \ 'directory_icon': '',
        \ 'opened_icon': '',
        \ 'root_icon': ' ',
        \ })
  \| call vista#RunForNearestMethodOrFunction()

let g:startify_skiplist = add(
      \ map(split(&runtimepath, ','), 'escape(resolve(v:val . ''/doc''), ''\'')'),
      \ 'COMMIT_EDITMSG')

autocmd MyAutoCmd User GoyoEnter nested call rubix#goyo#enter()
autocmd MyAutoCmd User GoyoLeave nested call rubix#goyo#leave()

function! s:cocInit() abort
  autocmd MyAutoCmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
endfunction

autocmd MyAutoCmd User CocNvimInit call s:cocInit()

" has to be run before VimEnter or else `vim <file>` won't be set properly,
" though subsequent files will (if put in VimEnter)
try
  call editorconfig#AddNewHook(function('rubix#editorconfig#filetype_hook'))
catch /.*/
endtry
