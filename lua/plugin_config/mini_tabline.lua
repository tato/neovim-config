vim.cmd[[
augroup mini_tabline_hl
autocmd!
au VimEnter * hi link MiniTablineCurrent         TabLineSel
au VimEnter * hi link MiniTablineVisible         TabLineSel
au VimEnter * hi link MiniTablineHidden          TabLine
au VimEnter * hi link MiniTablineModifiedCurrent StatusLine
au VimEnter * hi link MiniTablineModifiedVisible StatusLine
au VimEnter * hi link MiniTablineModifiedHidden  StatusLineNC
au VimEnter * hi link MiniTablineTabpagesection  Search
au VimEnter * hi link MiniTablineFill            TabLineFill
augroup end
]]

return {
    show_icons = false,
    set_vim_settings = true,
    tabpage_section = 'left'
}
