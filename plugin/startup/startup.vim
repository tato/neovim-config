autocmd GUIEnter * call startup#maximize() " go fullscreen at startup

augroup startup
    autocmd!
    au VimEnter * call startup#screen()
augroup END

