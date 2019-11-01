let g:fzf_history_dir = rubix#cache#dir('fzf')
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '10' }
let g:fzf_nvim_statusline = 0

let g:fzf_colors = {
  \   'fg':      ['fg', 'Normal'],
  \   'bg':      ['bg', 'Normal'],
  \   'hl':      ['fg', 'Comment'],
  \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \   'hl+':     ['fg', 'Statement'],
  \   'info':    ['fg', 'PreProc'],
  \   'border':  ['fg', 'Ignore'],
  \   'prompt':  ['fg', 'Conditional'],
  \   'pointer': ['fg', 'Exception'],
  \   'marker':  ['fg', 'Keyword'],
  \   'spinner': ['fg', 'Label'],
  \   'header':  ['fg', 'Comment']
  \ }
command! -bang FilesProjectDir call fzf#vim#files(rubix#project_dir(), <bang>0)
command! -bang FilesBufferDir  call fzf#vim#files(rubix#buffer_dir(),  <bang>0)
command! -bang FilesCurrentDir call fzf#vim#files(rubix#current_dir(), <bang>0)
command! -bang FilesInputDir   call fzf#vim#files(rubix#input_dir(),   <bang>0)

command! -bang -nargs=* RgProjectDir call rubix#fzf#rg(<q-args>, rubix#project_dir(), <bang>0)
command! -bang -nargs=* RgBufferDir  call rubix#fzf#rg(<q-args>,  rubix#buffer_dir(), <bang>0)
command! -bang -nargs=* RgCurrentDir call rubix#fzf#rg(<q-args>, rubix#current_dir(), <bang>0)
command! -bang -nargs=* RgInputDir   call rubix#fzf#rg(<q-args>,   rubix#input_dir(), <bang>0)

command! -bang RgProjectDirCursor call rubix#fzf#rg(expand('<cword>'), rubix#project_dir(), <bang>0)
command! -bang RgBufferDirCursor  call rubix#fzf#rg(expand('<cword>'), rubix#buffer_dir(),  <bang>0)
command! -bang RgCurrentDirCursor call rubix#fzf#rg(expand('<cword>'), rubix#current_dir(), <bang>0)
command! -bang RgInputDirCursor   call rubix#fzf#rg(expand('<cword>'), rubix#input_dir(),   <bang>0)

command! -bang RgProjectDirPrompt call rubix#fzf#rg(rubix#input_word(), rubix#project_dir(), <bang>0)
command! -bang RgBufferDirPrompt  call rubix#fzf#rg(rubix#input_word(), rubix#buffer_dir(),  <bang>0)
command! -bang RgCurrentDirPrompt call rubix#fzf#rg(rubix#input_word(), rubix#current_dir(), <bang>0)
command! -bang RgInputDirPrompt   call rubix#fzf#rg(rubix#input_word(), rubix#input_dir(),   <bang>0)

command! -bang RgRepeat call rubix#fzf#rg_repeat(<bang>0)
command! -bang RubixHistory call rubix#fzf#history(<bang>0)
