if exists('g:GuiLoaded')
  set guifont=SFMono\ Nerd\ Font:h11
  GuiTabline 0
endif

if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'SFMono Nerd Font 11')
  call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
  call rpcnotify(1, 'Gui', 'Command', 'PreferDarkTheme', 1)
  let g:GuiInternalClipboard = 1
endif

colorscheme hybrid
