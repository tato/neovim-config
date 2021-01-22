function! startup#maximize()
    if has("gui_running")
        if g:env =~ 'WINDOWS'
            simalt ~x | normal! <C-W>=
        elseif g:env =~ 'LINUX'
            set lines=999 columns=999 | normal! <C-W>=
        endif
    endif
endfunction

function! s:draw_startup_art(art)
    let b:art_width = 0
    for line in a:art
        if len(line) > b:art_width
            let b:art_width = len(line)
        endif
    endfor
    let b:art_height = len(a:art)

    let b:spaces = repeat(' ', (winwidth(0) - b:art_width) / 2)
    let b:newlines = (winheight(0) - b:art_height - 6) / 2
    while b:newlines > 0
        call append('$', '')
        let b:newlines -= 1
    endwhile
    for line in a:art
        call append('$', b:spaces.line)
    endfor
endfunction

function! s:draw_mru()
    let l:oldfiles = split(execute('oldfiles'), '\n')[:4]
    let l:max_width = 0
    for l:oldfile in l:oldfiles
        if len(l:oldfile) > l:max_width
            let l:max_width = len(l:oldfile)
        endif
    endfor
    let l:spaces = repeat(' ', (winwidth(0) - l:max_width) / 2)
    call append('$', '')
    for l:oldfile in l:oldfiles
        call append('$', l:spaces.l:oldfile)
    endfor
endfunction

function! s:maybe_update_startup_screen(art)
    let l:variables_exist = exists('b:previous_width') && exists('b:previous_height')
    if !l:variables_exist || b:previous_width!=winwidth(0) || b:previous_height!=winheight(0)
        let b:previous_width  = winwidth(0)
        let b:previous_height = winheight(0)

        setlocal modifiable
        normal ggVGd
        call s:draw_startup_art(a:art)
        call s:draw_mru()
        setlocal nomodifiable nomodified
        normal jk
    endif
endfunction

function! startup#screen()
    if !argc() && line2byte('$')==-1 && v:progname =~? '^[-gmnq]\=vim\=x\=\%[\.exe]$'
        enew
        setlocal bufhidden=wipe buftype=nofile nobuflisted nocursorcolumn
        setlocal nocursorline nolist nonumber noswapfile norelativenumber

        function! s:_ascii_art()
            VIIIIIIIIIIIIIIM

        ~+

                 *       +
           '                  |
       ()    .-.,="``"=.    - o -
             '=/_       \     |
          *   |  '=._    |
     *         \     `=./`,        '
            .   '=.__.=' `='      *
   +                         +
        O      *        '       .
        endfunction
        let l:raw_ascii_art = execute('function s:_ascii_art')
        let s:ascii_art = [ ]
        for l:raw_line in split(l:raw_ascii_art, '\n')[1:-2]
            let l:line = l:raw_line[3:]
            call add(s:ascii_art, l:line)
        endfor

        augroup startup_screen_update
            autocmd! * <buffer>
            au CursorHold <buffer> call s:maybe_update_startup_screen(s:ascii_art)
            au VimResized <buffer> call s:maybe_update_startup_screen(s:ascii_art)
        augroup END
        call s:maybe_update_startup_screen(s:ascii_art)

        setlocal nomodifiable nomodified

        nnoremap <buffer><silent> a :enew<CR>
        nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
        nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
    endif

endfunction
