" move to the window in a direction. if there is no window in that
" direction, create a new one.
" this function can only take as argument "h", "j", "k" or "l"
fu bufmove#move(direction)
    let l:winnr_before = winnr()
    execute "wincmd "..a:direction

    if winnr_before ==# winnr()
        let l:splitbelow = &splitbelow
        let l:splitright = &splitright

        if a:direction ==# "h"
            set nosplitright
            vsplit
        elseif a:direction ==# "j"
            set splitbelow
            split
        elseif a:direction ==# "k"
            set nosplitbelow
            split
        elseif a:direction ==# "l"
            set splitright
            vsplit
        endif

        let &splitbelow = l:splitbelow
        let &splitright = l:splitright
    endif
endf
