
" This is free and unencumbered software released into the public domain.
" 
" Anyone is free to copy, modify, publish, use, compile, sell, or
" distribute this software, either in source code form or as a compiled
" binary, for any purpose, commercial or non-commercial, and by any
" means.
" 
" In jurisdictions that recognize copyright laws, the author or authors
" of this software dedicate any and all copyright interest in the
" software to the public domain. We make this dedication for the benefit
" of the public at large and to the detriment of our heirs and
" successors. We intend this dedication to be an overt act of
" relinquishment in perpetuity of all present and future rights to this
" software under copyright law.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
" OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
" ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
" OTHER DEALINGS IN THE SOFTWARE.
" 
" For more information, please refer to <https://unlicense.org>


set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "supok"

hi Normal gui=NONE guifg=#dad6ff guibg=#25242b
hi VertSplit gui=NONE guifg=#dad6ff guibg=#25242b
hi Identifier gui=NONE guifg=#a7a4c3 guibg=NONE
hi Comment gui=NONE guifg=#656565 guibg=NONE
hi Conceal gui=NONE guifg=#656565 guibg=NONE
hi Folded gui=NONE guifg=#656565 guibg=NONE
hi LineNr gui=NONE guifg=#656565 guibg=NONE
hi LineNrAbove gui=NONE guifg=#656565 guibg=NONE
hi LineNrBelow gui=NONE guifg=#656565 guibg=NONE
hi NonText gui=NONE guifg=#656565 guibg=NONE
hi Statement gui=bold guifg=#7c5ffc guibg=NONE
hi Type gui=bold guifg=#7c5ffc guibg=NONE
hi PreProc gui=bold guifg=#7c5ffc guibg=NONE
hi Constant gui=NONE guifg=#f9c236 guibg=NONE
hi Todo gui=NONE guifg=#f9c236 guibg=NONE
hi Directory gui=NONE guifg=#f9c236 guibg=NONE
hi CursorLineNr gui=NONE guifg=#f9c236 guibg=#3C3836
hi ColorColumn gui=NONE guifg=NONE guibg=#3C3836
hi CursorColumn gui=NONE guifg=NONE guibg=#3C3836
hi CursorLine gui=NONE guifg=NONE guibg=#3C3836
hi Operator gui=NONE guifg=NONE guibg=NONE
hi Delimiter gui=NONE guifg=NONE guibg=NONE
hi Cursor gui=NONE guifg=NONE guibg=#45444b
hi lCursor gui=NONE guifg=NONE guibg=#45444b
hi CursorIM gui=NONE guifg=NONE guibg=#45444b
hi TermCursor gui=NONE guifg=NONE guibg=#45444b
hi TermCursorNC gui=NONE guifg=NONE guibg=#45444b
hi Error gui=NONE guifg=red guibg=NONE
hi ErrorMsg gui=NONE guifg=red guibg=NONE
hi vimUserFunc gui=NONE guifg=NONE guibg=NONE
hi zigDummyVariable gui=NONE guifg=NONE guibg=NONE
hi zigVarDecl gui=bold guifg=#7c5ffc guibg=NONE
hi zigExecution gui=bold guifg=#7c5ffc guibg=NONE
