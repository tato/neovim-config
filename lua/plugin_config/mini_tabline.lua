vim.cmd[[
au VimEnter * ++once hi link MiniTablineCurrent         TabLineSel
au VimEnter * ++once hi link MiniTablineVisible         TabLineSel
au VimEnter * ++once hi link MiniTablineHidden          TabLine
au VimEnter * ++once hi link MiniTablineModifiedCurrent StatusLine
au VimEnter * ++once hi link MiniTablineModifiedVisible StatusLine
au VimEnter * ++once hi link MiniTablineModifiedHidden  StatusLineNC
au VimEnter * ++once hi link MiniTablineTabpagesection  Search
au VimEnter * ++once hi link MiniTablineFill            TabLineFill
]]

return {
    show_icons = false,
    set_vim_settings = true,
    tabpage_section = 'left'
}
