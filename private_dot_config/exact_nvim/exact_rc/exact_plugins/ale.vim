scriptencoding utf-8

highlight link ALEErrorSign   ErrorMsg
highlight link ALEWarningSign Type

let g:ale_emit_conflict_warnings = 1
let g:ale_echo_msg_format = '[%severity%] %s [%linter%]'
let g:ale_sign_error      = '🔥'
let g:ale_sign_warning    = '🚧'
let g:ale_sign_info       = '💬'
let g:ale_fix_on_save     = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '%code: %%s [%linter%]'
let g:ale_virtualtext_cursor = 0
let g:ale_disable_lsp = 1

highlight link ALEError   ErrorMsg
highlight link ALEWarning CursorLineNr
highlight link ALEInfo    Conceal

let g:ale_fixers = {
\   'css':       [ 'prettier' ],
\   'go':        [ 'goimports', 'gofmt' ],
\   'gomod':     [ 'gomod' ],
\   'json':      [ 'prettier' ],
\   'less':      [ 'prettier' ],
\   'scss':      [ 'prettier' ],
\   'terraform': [ 'terraform' ],
\}

let g:ale_linters = {
\   'go':         [ 'golangci-lint' ],
\   'javascript': [ 'standard' ],
\   'jsx':        [ 'standard' ],
\   'markdown':   [ 'markdownlint', 'mdl', 'redpen', 'remark_lint', 'textlint', 'vale' ],
\   'proto':      [ 'prototool' ],
\   'python':     [],
\   'text':       [ 'alex', 'proselint', 'vale', 'write-good', 'redpen' ],
\   'typescript': [],
\   'vimwiki':    [ 'alex', 'mdl', 'prettier', 'proselint', 'redpen', 'remark-lint', 'vale' ],
\}

let g:ale_go_goimports_executable = 'gofumports'
let g:ale_go_gofmt_executable = 'gofumpt'
let g:ale_go_gofmt_options = '-s'
let g:ale_go_goimports_options = '-local go.ngrok.com'
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = ''
\   . ' --exclude-use-default'
\   . ' --out-format=line-number'
\   . ' --tests'
\   . ' --print-issued-lines=false'
\   . ' --disable-all'
\   . ' --enable=deadcode'
\   . ' --enable=errcheck'
\   . ' --enable=golint'
\   . ' --enable=gosec'
\   . ' --enable=ineffassign'
\   . ' --enable=megacheck'
\   . ' --enable=misspell'
\   . ' --enable=prealloc'
\   . ' --enable=scopelint'
\   . ' --enable=structcheck'
\   . ' --enable=unconvert'
\   . ' --enable=varcheck'

let g:ale_linter_aliases = {
\   'jsx': 'css',
\   'vimwiki': 'markdown',
\ }

let g:ale_javascript_standard_options = ''
\   . ' --plugin react'
\   . ' --plugin flowtype'
\   . ' --parser babel-eslint'

let g:ale_c_clang_options = '-std=c11 -Wall -Wextra -Weverything'
