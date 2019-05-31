call which_key#register(',', 'g:which_key_map')

let g:which_key_map.c = {'name': '+code'}
let g:which_key_map.f = {'name': '+format'}

let g:which_key_map['_'] = {
      \ 'name': '+comment',
      \ '_':    'comment',
      \ 'p':    'comment the current inner paragraph',
      \ ' ':    ':TComment <query comment-begin ?comment-end>',
      \ 'i':    'comment inline',
      \ 'r':    'comment right',
      \ 'b':    'comment block',
      \ 'a':    ':TcommentAs <query comment type>',
      \ 'n':    ':TcommentAs &filetype <query count>',
      \ 's':    ':TcommentAs &filetype_<query comment subtype>',
      \ }

nnoremap <silent> <leader>n :silent :nohlsearch<cr>
let g:which_key_map.n = 'stop highlighting search'

" find merge conflict markers
noremap <leader>fc /\v^[<\|=>]{7}( .*\|$)<cr>
let g:which_key_map.f.c = 'find merge conflict markers'

nnoremap <silent> <leader>q :qa<cr>
let g:which_key_map.q = 'quit'

nnoremap <silent> <leader>Q :qa!<cr>
let g:which_key_map.Q = 'quit without saving'

" <leader>cd: Switch to the directory of the open buffer
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>
let g:which_key_map.c.d = 'lcd to buffer dir'

" <leader>m: Toggle Maximize current window
nnoremap <leader>m :call rubix#maximize_toggle()<cr>
let g:which_key_map.m = 'maximize toggle'

" <leader>,: Switch to previous window
nnoremap <leader>p <c-w>p
let g:which_key_map['p'] = 'previous window'

let g:which_key_map[','] = {'name': '+easymotion'}

map <silent> <leader><leader>f <plug>(easymotion-f)
let g:which_key_map[','].f = 'char to the right'

map <silent> <leader><leader>F <plug>(easymotion-F)
let g:which_key_map[','].F = 'char to the left'

map <silent> <leader><leader>t <plug>(easymotion-t)
let g:which_key_map[','].t = 'till before char to the right'

map <silent> <leader><leader>T <plug>(easymotion-T)
let g:which_key_map[','].T = 'till after char to the left'

map <silent> <leader><leader>w <plug>(easymotion-w)
let g:which_key_map[','].w = 'beginning of word forward'

map <silent> <leader><leader>W <plug>(easymotion-W)
let g:which_key_map[','].W = 'beginning of WORD forward'

map <silent> <leader><leader>b <plug>(easymotion-b)
let g:which_key_map[','].b = 'beginning of word backward'

map <silent> <leader><leader>B <plug>(easymotion-B)
let g:which_key_map[','].B = 'beginning of WORD backward'

map <silent> <leader><leader>e <plug>(easymotion-e)
let g:which_key_map[','].e = 'end of word forward'

map <silent> <leader><leader>E <plug>(easymotion-E)
let g:which_key_map[','].E = 'end of WORD forward'

let g:which_key_map[','].g = {'name': '+end-of-word'}

map <silent> <leader><leader>ge <plug>(easymotion-ge)
let g:which_key_map[','].g.e = 'end of word backward'

map <silent> <leader><leader>gE <plug>(easymotion-gE)
let g:which_key_map[','].g.E = 'end of WORD backward'

map <silent> <leader><leader>j <plug>(easymotion-j)
let g:which_key_map[','].j = 'line downward'

map <silent> <leader><leader>k <plug>(easymotion-k)
let g:which_key_map[','].k = 'line upward'

map <silent> <leader><leader>n <plug>(easymotion-n)
let g:which_key_map[','].n = 'jump to search forward'

map <silent> <leader><leader>N <plug>(easymotion-N)
let g:which_key_map[','].N = 'jump to search backward'

map <silent> <leader><leader>s <plug>(easymotion-s)
let g:which_key_map[','].s = 'search char forward and backward'

" adjust viewports to the same size
noremap <leader>= <c-w>=
let g:which_key_map['='] = 'make windows equal size'

" formatting shortcuts
nnoremap <leader>fa :call rubix#preserve('normal gg=G')<cr>
let g:which_key_map.f.a = 'indent whole file'

nnoremap <leader>f$ :call rubix#trim()<cr>
let g:which_key_map.f['$'] = 'trim trailing whitespace'

nnoremap <leader>fR :source $MYVIMRC<cr>
let g:which_key_map.f.R = 'reload .vimrc'

vnoremap <leader>s :sort<cr>

cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-f> <left>
cnoremap <c-g> <right>

" ctrl-v: Paste
cnoremap <c-v> <c-r>"

" Q: Closes the window
nnoremap <silent> Q :q<cr>

" W: Save
nnoremap <silent> W :w<cr>

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

" plugin specific mappings

" surround
" ctrl-sw: Quickly surround word (must be recursive)
nmap <c-s><c-w> ysiw

" undotree
nnoremap <leader>u :UndotreeToggle<cr>
let g:which_key_map.u = 'undotree toggle'

" bufsurf
nnoremap <silent> Z :BufSurfBack<cr>
nnoremap <silent> X :BufSurfForward<cr>

" vista
nnoremap <silent> <c-g> :Vista!!<cr>

" easy align
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

" fugitive/gitv
let g:which_key_map.g = {'name': '+git'}
nnoremap <silent> <leader>gs :Gstatus<cr>
let g:which_key_map.g.s = 'status'

nnoremap <silent> <leader>gd :Gvdiff<cr>
let g:which_key_map.g.d = 'diff'

nnoremap <silent> <leader>gc :Gcommit<cr>
let g:which_key_map.g.c = 'commit'

nnoremap <silent> <leader>gb :Gblame<cr>
let g:which_key_map.g.b = 'blame'

nnoremap <silent> <leader>gl :Glog<cr>
let g:which_key_map.g.l = 'log'

nnoremap <silent> <leader>gp :Gpush<cr>
let g:which_key_map.g.p = 'push'

nnoremap <silent> <leader>gr :Gremove<cr>
let g:which_key_map.g.r = 'remove'

nnoremap <silent> <leader>gw :Gwrite<cr>
let g:which_key_map.g.w = 'write'

nnoremap <silent> <leader>ge :Gedit<cr>
let g:which_key_map.g.e = 'edit'

nnoremap <silent> <leader>g. :Gcd<cr>:pwd<cr>
let g:which_key_map.g['.'] = 'cd'

nnoremap <silent> <leader>gu :Gpull<cr>
let g:which_key_map.g.u = 'pull'

nnoremap <silent> <leader>gn :Gmerge<cr>
let g:which_key_map.g.n = 'merge'

nnoremap <silent> <leader>gf :Gfetch<cr>
let g:which_key_map.g.f = 'fetch'

nnoremap <silent> <leader>gv :Gitv<cr>
let g:which_key_map.g.v = 'browse'

nnoremap <silent> <leader>gV :Gitv!<cr>
let g:which_key_map.g.V = 'browse (file mode)'

nmap <leader>gm <plug>(git-messenger)
let g:which_key_map.g.m = 'git message for line'

" - if completion popup is showing:
"   - if nothing is selected and the text is expandable, expand it
"   - else accept the completion entry
" - else if the text is expandable, expand it
" - else if endwise exists, use it to complete (includes <cr>)
" - else <cr>
inoremap <silent> <expr> <cr>
  \ pumvisible() && len(v:completed_item) == 0 && neosnippet#expandable() ? neosnippet#mappings#expand_impl() :
  \ pumvisible() ? "\<c-y>" :
  \ neosnippet#expandable() ? neosnippet#mappings#expand_impl() :
  \ "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>\<c-r>=EndwiseDiscretionary()<cr>"

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
"   - select completed value and switch to normal mode (note that this will not
"     do snippet completion because it is async and the switch to normal mode
"     happens first
" - else <esc>
inoremap <expr> <silent> <esc> pumvisible() ? "\<c-y>\<esc>" : "\<esc>"

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

  inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<esc>\<c-w>j"
  inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<esc>\<c-w>k"

  " save the buffer mode when leaving, restore (insert) mode if necessary
  autocmd MyAutoCmd BufEnter,WinEnter * :call rubix#terminal#restore_mode()
  autocmd MyAutoCmd BufLeave,WinLeave * :call rubix#terminal#save_mode()

  if has('nvim')
    tnoremap <expr> <c-h> rubix#terminal#save_mode() . "\<c-w>h"
    tnoremap <expr> <c-j> rubix#terminal#save_mode() . "\<c-w>j"
    tnoremap <expr> <c-k> rubix#terminal#save_mode() . "\<c-w>k"
    tnoremap <expr> <c-l> rubix#terminal#save_mode() . "\<c-w>l"

    tnoremap <c-y> <c-\><c-n><c-y>
    tnoremap <c-u> <c-\><c-n><c-u>

    tnoremap <silent> <expr> <c-p> rubix#terminal#save_mode() . ":FilesProjectDir\<cr>"
    tnoremap <silent> <expr> <c-b> rubix#terminal#save_mode() . ":Buffers\<cr>"

    " switch to insert mode and press <up> for shell history when in normal mode
    autocmd MyAutoCmd TermOpen * nnoremap <buffer> <up> i<up>
    autocmd MyAutoCmd TermOpen * nnoremap <buffer> <c-r> i<c-r>

    " disable macros in terminal windows
    autocmd MyAutoCmd TermOpen * nnoremap <buffer> q <nop>
  endif

  if has('terminal')
    tnoremap <c-h> <c-w>h
    tnoremap <c-j> <c-w>j
    tnoremap <c-k> <c-w>k
    tnoremap <c-l> <c-w>l
    tnoremap <c-y> <c-\><c-n><c-y>
    tnoremap <c-u> <c-\><c-n><c-u>
    tnoremap <c-w> <c-w>.

    tnoremap <silent> <c-p> <c-\><c-n>:FilesProjectDir<cr>
    tnoremap <silent> <c-b> <c-\><c-n>:Buffers<cr>

    " switch to insert mode and press <up> for shell history when in normal mode
    autocmd MyAutoCmd TerminalOpen * nnoremap <buffer> <up> i<up>
    autocmd MyAutoCmd TerminalOpen * nnoremap <buffer> <c-r> i<c-r>

    " disable macros in terminal windows
    autocmd MyAutoCmd TerminalOpen * nnoremap <buffer> q <nop>
  endif
endif

tnoremap <silent> <expr> <c-x> rubix#terminal#save_mode() . ":TerminalToggle\<cr>"
nnoremap <silent> <c-x> :TerminalToggle<cr>
inoremap <silent> <c-x> <c-\><c-n>:TerminalToggle<cr>

" fzf
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <silent> <c-p> :FilesProjectDir<cr>
nnoremap <silent> <c-b> :Buffers<cr>
nnoremap <silent> <c-f> :RubixHistory<cr>
nnoremap <silent> <c-s><c-a> :RgRepeat<cr>
nnoremap <silent> <c-s><c-s> :RgProjectDirCursor<cr>
nnoremap <silent> <c-s><c-d> :RgProjectDirPrompt<cr>
nnoremap <silent> <c-s><c-f> :BLines<cr>

" netrw
noremap <silent> <c-n> :Defx<cr>

" coc mappings

nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)

nnoremap <silent> K :call <sid>show_documentation()<cr>

function! s:show_documentation() abort
  if &filetype ==# 'vim'
    execute 'help '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Format :call CocAction('format')

nnoremap <silent> <leader>cl :<c-u>CocList diagnostics<cr>
let g:which_key_map.c.l = 'list workspace diagnostics'

nnoremap <silent> <leader>ce :<c-u>CocList extensions<cr>
let g:which_key_map.c.e = 'manage coc extensions'

nnoremap <silent> <leader>cc :<c-u>CocList commands<cr>
let g:which_key_map.c.c = 'list workspace commands'

nnoremap <silent> <leader>co :<c-u>CocList outline<cr>
let g:which_key_map.c.o = 'list document symbols'

nnoremap <silent> <leader>cs :<c-u>CocList -I symbols<cr>
let g:which_key_map.c.s = 'search workspace symbols'

nnoremap <silent> <leader>cj :<c-u>CocNext<cr>
let g:which_key_map.c.j = 'invoke default action for next list item'

nnoremap <silent> <leader>ck :<c-u>CocPrev<cr>
let g:which_key_map.c.k = 'invoke default action for prev list item'

nnoremap <silent> <leader>cp :<c-u>CocListResume<cr>
let g:which_key_map.c.p = 'reopen last opened list'

nmap <leader>ca <plug>(coc-codeaction)
let g:which_key_map.c.a = 'run code action(s) for current line'

nmap <leader>cf <plug>(coc-fix-current)
let g:which_key_map.c.f = 'run quickfix action for current line'

nmap <leader>cr <plug>(coc-rename)
let g:which_key_map.c.r = 'rename symbol under cursor'

nmap <leader>? <plug>(fzf-maps-n)
let g:which_key_map['?'] = ['Maps', 'show keybindings']

xmap <leader>? <plug>(fzf-maps-x)
omap <leader>? <plug>(fzf-maps-o)

nnoremap <silent> <leader> :<c-u>WhichKey ','<cr>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual ','<cr>

let g:which_key_map.b = { 'name': '+buffer' }

for s:i in range(1, 9)
  " <leader>[1-9] move to window [1-9]
  execute 'nnoremap <silent> <leader>'.s:i ' :'.s:i.'wincmd w<cr>'
  let g:which_key_map[s:i] = 'window-'.s:i

  " <leader>b[1-9] move to buffer [1-9]
  execute 'nnoremap <silent> <leader>b'.s:i ':b'.s:i.'<cr>'
  let g:which_key_map.b[s:i] = 'buffer-'.s:i
endfor
unlet s:i

nnoremap <silent> <leader>t :call rubix#terminal#new()<cr>
let g:which_key_map.t = 'terminal'

nnoremap <silent> <leader>bh :Startify<cr>
let g:which_key_map.b.h = 'startify'

nmap <leader>w <plug>(choosewin)
let g:which_key_map.w = 'choose window'

map n <plug>(is-nohl)<plug>(anzu-n-with-echo)
map N <plug>(is-nohl)<plug>(anzu-N-with-echo)

" resize window
nnoremap <silent> <c-a>H <c-w><
nnoremap <silent> <c-a>L <c-w>>
nnoremap <silent> <c-a>J <c-w>+
nnoremap <silent> <c-a>K <c-w>-
vnoremap <silent> <c-a>H <c-w><
vnoremap <silent> <c-a>L <c-w>>
vnoremap <silent> <c-a>J <c-w>+
vnoremap <silent> <c-a>K <c-w>-
inoremap <silent> <c-a>H <esc><c-w><
inoremap <silent> <c-a>L <esc><c-w>>
inoremap <silent> <c-a>J <esc><c-w>+
inoremap <silent> <c-a>K <esc><c-w>-
tnoremap <silent> <c-a>H <c-\><c-n><c-w><
tnoremap <silent> <c-a>L <c-\><c-n><c-w>>
tnoremap <silent> <c-a>J <c-\><c-n><c-w>+
tnoremap <silent> <c-a>K <c-\><c-n><c-w>-

" abbreviations
iabbrev TODO TODO(jawa)
iabbrev meml me@jawa.dev
iabbrev weml joshua@ngrok.com

command! -nargs=0 TerminalToggle :call rubix#terminal#toggle(<q-mods>)
