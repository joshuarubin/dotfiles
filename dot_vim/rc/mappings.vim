nnoremap <silent> <leader>n :silent :nohlsearch<cr>

" find merge conflict markers
noremap <leader>fc /\v^[<\|=>]{7}( .*\|$)<cr>

" <leader>``: Force quit all
nnoremap <leader>`` :qa!<cr>

" <leader>q: Quit all, very useful in vimdiff
nnoremap <leader>q :qa<cr>

" <leader>cd: Switch to the directory of the open buffer
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>

" <leader>m: Toggle Maximize current window
nnoremap <leader>m :call rubix#maximize_toggle()<cr>

" <leader>,: Switch to previous window
nnoremap <leader>, <c-w>p

" adjust viewports to the same size
noremap <leader>= <c-w>=

" formatting shortcuts
nnoremap <leader>fef :call rubix#preserve('normal gg=G')<cr>
nnoremap <leader>f$ :call rubix#trim()<cr>
vnoremap <leader>s :sort<cr>

cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-f> <left>
cnoremap <c-g> <right>

" ctrl-v: Paste
cnoremap <c-v> <c-r>"

" Q: Closes the window
nnoremap Q :q<cr>

" W: Save
nnoremap W :w<cr>

" J: join without the cursor jumping around
" nnoremap J mzJ`z

" j, k: move up and down by row (of a wrapped line), not line
" nnoremap j gj
" nnoremap k gk

" Y: yank from the cursor to the end of the line (like D and C)
nnoremap Y y$

" U: Redos since 'u' undos
nnoremap U :redo<cr>

" _ : Quick horizontal splits
nnoremap <silent> _ :sp<cr>

" | : Quick vertical splits
nnoremap <silent> <bar> :vsp<cr>

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

" ctrl-sr: Easier (s)earch and (r)eplace
nnoremap <c-s><c-r> :%s/<c-r><c-w>//gc<left><left><left>

" ctrl-w: Delete previous word, create undo point
inoremap <c-w> <c-g>u<c-w>

" ctrl-s: Save
inoremap <c-s> <esc>:w<cr>

inoremap <expr> <down> pumvisible() ? "\<c-n>" : "\<down>"
inoremap <expr> <up>   pumvisible() ? "\<c-p>" : "\<up>"

" ctrl-c: Inserts line below
inoremap <c-c> <c-o>o

" ctrl-v: Paste. For some reason, <c-o> is not creating an undo point in the mapping
inoremap <c-v> <c-g>u<c-o>gP

" ctrl-c: copy (works with system clipboard due to clipboard setting)
vnoremap <c-c> y`]

" d: Delete into the blackhole register to not clobber the last yank
nnoremap d "_d

" dd: I use this often to yank a single line, retain its original behavior
nnoremap dd dd

" gp to visually select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" c: Change into the blackhole register to not clobber the last yank
nnoremap c "_c

" y: Yank and go to end of selection
xnoremap y y`]

" p: Paste in visual mode should not replace the default register with the deleted text
xnoremap p "_dP

" d: Delete into the blackhole register to not clobber the last yank. To 'cut', use 'x' instead
xnoremap d "_d

" enter: Highlight visual selections
xnoremap <silent> <cr> y:let @/ = @"<cr>:set hlsearch<cr>

" backspace: Delete selected and go into insert mode
xnoremap <bs> c

" <|>: Reselect visual block after indent
xnoremap < <gv
xnoremap > >gv

" .: repeats the last command on every line
xnoremap . :normal.<cr>

" @: repeats macro on every line
xnoremap @ :normal@

" tab: Indent (allow recursive)
xmap <tab> >

" shift-tab: unindent (allow recursive)
xmap <s-tab> <

" ctrl-a r to redraw the screen now
noremap <silent> <c-a>r :redraw!<cr>

" ctrl-w to delete the current buffer without closing the window
nnoremap <silent> <c-w><c-w> :confirm :Kwbd<cr>

" scrolling in insert mode
inoremap <c-d> <s-down>
inoremap <c-u> <s-up>
" inoremap <c-e> <c-x><c-e>
" inoremap <c-y> <c-x><c-y>

" plugin specific mappings

" surround
" ctrl-sw: Quickly surround word (must be recursive)
nmap <c-s><c-w> ysiw

" undotree
nnoremap <leader>u :UndotreeToggle<cr>

" bufsurf
nnoremap <silent> Z :BufSurfBack<cr>
nnoremap <silent> X :BufSurfForward<cr>

" vimpager
nnoremap <silent> <leader>v :Page<cr>

" tagbar
nnoremap <silent> <c-g> :TagbarToggle<cr>

" tabularize
nnoremap <leader>a&     :Tabularize /&<cr>
vnoremap <leader>a&     :Tabularize /&<cr>
nnoremap <leader>a=     :Tabularize /=<cr>
vnoremap <leader>a=     :Tabularize /=<cr>
nnoremap <leader>a:     :Tabularize /:<cr>
vnoremap <leader>a:     :Tabularize /:<cr>
nnoremap <leader>a::    :Tabularize /:\zs<cr>
vnoremap <leader>a::    :Tabularize /:\zs<cr>
nnoremap <leader>a,     :Tabularize /,<cr>
vnoremap <leader>a,     :Tabularize /,<cr>
nnoremap <leader>a,,    :Tabularize /,\zs<cr>
vnoremap <leader>a,,    :Tabularize /,\zs<cr>
nnoremap <leader>a<bar> :Tabularize /<bar><cr>
vnoremap <leader>a<bar> :Tabularize /<bar><cr>
nnoremap <leader>a\|    :Tabularize /\|<cr>
vnoremap <leader>a\|    :Tabularize /\|<cr>
nnoremap <leader>a#     :Tabularize /#<cr>
vnoremap <leader>a#     :Tabularize /#<cr>

" fugitive/gitv
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Gvdiff<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gl :Glog<cr>
nnoremap <silent> <leader>gp :Gpush<cr>
nnoremap <silent> <leader>gr :Gremove<cr>
nnoremap <silent> <leader>gw :Gwrite<cr>
nnoremap <silent> <leader>ge :Gedit<cr>
nnoremap <silent> <leader>gm :Gmove<cr>
nnoremap <silent> <leader>g. :Gcd<cr>:pwd<cr>
nnoremap <silent> <leader>gu :Gpull<cr>
nnoremap <silent> <leader>gn :Gmerge<cr>
nnoremap <silent> <leader>gf :Gfetch<cr>
nnoremap <silent> <leader>gv :Gitv<cr>
nnoremap <silent> <leader>gV :Gitv!<cr>

" - if completion popup is showing:
"   - if nothing is selected and the text is expandable, expand it
"   - else accept the completion entry
" - else if the text is expandable, expand it
" - else if endwise exists, use it to complete (includes <cr>)
" - else <cr>
imap <silent> <expr> <cr>
  \ pumvisible() && len(v:completed_item) == 0 && neosnippet#expandable() ? neosnippet#mappings#expand_impl() :
  \ pumvisible() ? "\<c-y>" :
  \ neosnippet#expandable() ? neosnippet#mappings#expand_impl() :
  \ exists('*EndwiseDiscretionary') ? "\<cr>\<plug>DiscretionaryEnd" :
  \ "\<cr>"

" - if completion popup is showing:
"   - if nothing is selected and the text is jumpable, jump next (for coc and neosnippet)
"   - else select next completion
" - else if the text is jumpable, jump next (for coc and neosnippet)
" - else <tab>
inoremap <expr> <tab>
  \ pumvisible() && len(v:completed_item) == 0 && neosnippet#jumpable() ? neosnippet#mappings#jump_impl() :
  \ pumvisible() && len(v:completed_item) == 0 && coc#jumpable() ? coc#rpc#request('snippetNext', []) :
  \ pumvisible() ? "\<c-n>" :
  \ neosnippet#jumpable() ? neosnippet#mappings#jump_impl() :
  \ coc#jumpable() ? coc#rpc#request('snippetNext', []) :
  \ "\<tab>"

" - if completion popup is showing:
"   - if nothing is selected and the text is jumpable, jump prev (for coc)
"   - else select previous completion
" - else if the text is jumpable, jump prev (for coc)
" - else <backspace>
inoremap <expr> <s-tab>
  \ pumvisible() && len(v:completed_item) == 0 && coc#jumpable() ? coc#rpc#request('snippetPrev', []) :
  \ pumvisible() ? "\<c-p>" :
  \ coc#jumpable() ? coc#rpc#request('snippetPrev', []) :
  \ "\<c-h>"

" when filling out expanded snippet, jump prev (for coc)
snoremap <expr> <s-tab>
  \ coc#jumpable() ? coc#rpc#request('snippetPrev', []) :
  \ ""

" when filling out expanded snippet, jump next (for coc and neosnippet)
snoremap <expr> <tab>
  \ neosnippet#jumpable() ? neosnippet#mappings#jump_impl() :
  \ coc#jumpable() ? coc#rpc#request('snippetNext', []) :
  \ "\<tab>"

" show the completion popup
inoremap <silent> <expr> <c-space> coc#refresh()

" - if completion popup is showing:
"   - if no completion is selected
"     - stop completion and go back to originally typed text
"     - return to normal mode
"   - else if a completion is selected
"     - accept the completion
"     - return to normal mode
" - else <esc>
inoremap <expr> <silent> <esc>
  \ pumvisible() && len(v:completed_item) == 0 ? "\<c-e>\<esc>" :
  \ pumvisible() ? "\<c-y>\<esc>" :
  \ "\<esc>"

" tmux style navigation
if !exists('$TMUX')
  nnoremap <c-h> <c-w>h
  nnoremap <c-j> <c-w>j
  nnoremap <c-k> <c-w>k
  nnoremap <c-l> <c-w>l

  vnoremap <c-h> <c-w>h
  vnoremap <c-j> <c-w>j
  vnoremap <c-l> <c-w>l
  vnoremap <c-k> <c-w>k

  inoremap <c-h> <esc><c-w>h
  inoremap <c-l> <esc><c-w>l

  inoremap <expr> <c-j>
    \ pumvisible() ? "\<c-n>" :
    \ "\<esc>\<c-w>j"
  inoremap <expr> <c-k>
    \ pumvisible() ? "\<c-p>" :
    \ "\<esc>\<c-w>k"

  if has('nvim')
    tnoremap <c-h> <c-\><c-n><c-w>h
    tnoremap <c-j> <c-\><c-n><c-w>j
    tnoremap <c-k> <c-\><c-n><c-w>k
    tnoremap <c-l> <c-\><c-n><c-w>l
    tnoremap <c-y> <c-\><c-n><c-y>
    tnoremap <c-u> <c-\><c-n><c-u>

    " switch to insert mode and press <up> for shell history when in normal mode
    autocmd MyAutoCmd TermOpen term://* nnoremap <buffer> <up> i<up>
    autocmd MyAutoCmd TermOpen term://* nnoremap <buffer> <c-r> i<c-r>

    " disable macros in terminal windows
    autocmd MyAutoCmd TermOpen term://* nnoremap <buffer> q <nop>
  endif

  if has('terminal')
    tnoremap <c-h> <c-w>h
    tnoremap <c-j> <c-w>j
    tnoremap <c-k> <c-w>k
    tnoremap <c-l> <c-w>l
    tnoremap <c-y> <c-\><c-n><c-y>
    tnoremap <c-u> <c-\><c-n><c-u>
    tnoremap <c-w> <c-w>.

    " switch to insert mode and press <up> for shell history when in normal mode
    autocmd MyAutoCmd TerminalOpen * nnoremap <buffer> <up> i<up>
    autocmd MyAutoCmd TerminalOpen * nnoremap <buffer> <c-r> i<c-r>

    " disable macros in terminal windows
    autocmd MyAutoCmd TerminalOpen * nnoremap <buffer> q <nop>
  endif
endif

" fzf
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <silent> <c-p> :FilesProjectDir<cr>
nnoremap <silent> <c-b> :Buffers<cr>
nnoremap <silent> <c-f> :RubixHistory<cr>
nnoremap <silent> <c-s><c-a> :RgRepeat<cr>
nnoremap <silent> <c-s><c-s> :RgProjectDirCursor<cr>
nnoremap <silent> <c-s><c-d> :RgProjectDirPrompt<cr>
nnoremap <silent> <c-s><c-f> :BLines<cr>

if has('nvim') || has('terminal')
  tnoremap <silent> <c-p> <c-\><c-n>:FilesProjectDir<cr>
  tnoremap <silent> <c-b> <c-\><c-n>:Buffers<cr>
endif

" netrw
noremap <silent> <c-n> :call rubix#toggle_netrw()<cr>

" abbreviations
iabbrev TODO TODO(jawa)
iabbrev meml me@jawa.dev
iabbrev weml joshua@ngrok.com

" coc mappings

nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)
nmap <leader>rn <plug>(coc-rename)
nmap <leader>ff <plug>(coc-fix-current)
nmap <leader>ac <plug>(coc-codeaction)

nnoremap <silent> K :call <sid>show_documentation()<cr>

function! s:show_documentation() abort
  if &filetype ==# 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Format :call CocAction('format')

nnoremap <silent> <leader>ca :<c-u>CocList diagnostics<cr>
nnoremap <silent> <leader>ce :<c-u>CocList extensions<cr>
nnoremap <silent> <leader>cc :<c-u>CocList commands<cr>
nnoremap <silent> <leader>co :<c-u>CocList outline<cr>
nnoremap <silent> <leader>cs :<c-u>CocList -I symbols<cr>
nnoremap <silent> <leader>cj :<c-u>CocNext<cr>
nnoremap <silent> <leader>ck :<c-u>CocPrev<cr>
nnoremap <silent> <leader>cp :<c-u>CocListResume<cr>
