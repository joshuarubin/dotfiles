" vint: next-line -ProhibitSetNoCompatible
set nocompatible

runtime rc/init.vim
runtime rc/view.vim

if has('eval')
  runtime rc/plugins.vim
endif

runtime rc/edit.vim
runtime rc/mappings.vim
runtime rc/gui.vim

set exrc   " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files
