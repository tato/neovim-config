" move to the window in a direction. if there is no window in that
" direction, create a new one.
" this function can only take as argument "h", "j", "k" or "l"
function supok#move(direction)
    let nr = winnr()
    execute "wincmd " . a:direction
    if winnr() == nr
        wincmd n
        execute "wincmd " . toupper(a:direction)
    endif
endf

function supok#configure_gruvbox()
    " i have no idea why this has a new line at the start
    if execute("colorscheme") ==# "\ngruvbox"
        return
    endif

    let g:gruvbox_bold = 1
    let g:gruvbox_italic = 0
    let g:gruvbox_transparent_bg = 1
    let g:gruvbox_underline = 1
    let g:gruvbox_undercurl = 1
    let g:gruvbox_contrast_dark = "hard"
    let g:gruvbox_contrast_light = "medium"
    let g:gruvbox_italicize_strings = 0
    let g:gruvbox_improved_strings = 1
    colorscheme gruvbox
endf


function supok#mapping(keys, mapping, desc)
    execute "nnoremap <leader>" . a:keys . " " . a:mapping
    let let_stmt = "let g:which_key_map"
    for s:char in split(a:keys, '\zs')
        let let_stmt = let_stmt . "." . s:char
    endfor
    let let_stmt = let_stmt . " = a:desc"
    execute let_stmt
endf

" see adjust_comment_line_length on init.vim
function supok#adjust_comment_line_length()
    let syn_element = synIDattr(synID(line("."), col(".") - 1, 1), "name")
    let &textwidth = syn_element =~? 'comment' ? 79 : 0
    echo "tw = " . &textwidth
endfunction
