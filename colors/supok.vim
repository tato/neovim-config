
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

hi Normal gui=NONE guifg=#dad6ff guibg=#16151c
hi VertSplit gui=NONE guifg=#dad6ff guibg=#16151c
hi Identifier gui=NONE guifg=#a7a4c3 guibg=NONE
hi Comment gui=NONE guifg=#656565 guibg=NONE
hi Conceal gui=NONE guifg=#656565 guibg=NONE
hi Folded gui=NONE guifg=#656565 guibg=NONE
hi LineNr gui=NONE guifg=#656565 guibg=NONE
hi LineNrAbove gui=NONE guifg=#656565 guibg=NONE
hi LineNrBelow gui=NONE guifg=#656565 guibg=NONE
hi NonText gui=NONE guifg=#656565 guibg=NONE
hi Pmenu gui=NONE guifg=#656565 guibg=#25242b
hi Statement gui=bold guifg=#7259e0 guibg=NONE
hi Conditional gui=bold guifg=#b559e0 guibg=NONE
hi Repeat gui=bold guifg=#b559e0 guibg=NONE
hi Exception gui=bold guifg=#b559e0 guibg=NONE
hi Type gui=bold guifg=#84a7f4 guibg=NONE
hi StorageClass gui=bold guifg=#7259e0 guibg=NONE
hi Structure gui=bold guifg=#7259e0 guibg=NONE
hi Typedef gui=bold guifg=#7259e0 guibg=NONE
hi PreProc gui=bold guifg=#7259e0 guibg=NONE
hi Title gui=bold guifg=#7259e0 guibg=NONE
hi Constant gui=NONE guifg=#f4c755 guibg=NONE
hi String gui=NONE guifg=#d2f455 guibg=NONE
hi Directory gui=NONE guifg=#f4c755 guibg=NONE
hi CursorLineNr gui=NONE guifg=#f4c755 guibg=#352d38
hi Todo gui=NONE guifg=#25242b guibg=#f47855
hi ColorColumn gui=NONE guifg=NONE guibg=#352d38
hi CursorColumn gui=NONE guifg=NONE guibg=#352d38
hi CursorLine gui=NONE guifg=NONE guibg=#352d38
hi Operator gui=NONE guifg=NONE guibg=NONE
hi Delimiter gui=NONE guifg=NONE guibg=NONE
hi Special gui=NONE guifg=NONE guibg=NONE
hi FoldColumn gui=NONE guifg=NONE guibg=NONE
hi SignColumn gui=NONE guifg=NONE guibg=NONE
hi Cursor gui=NONE guifg=NONE guibg=#25242b
hi lCursor gui=NONE guifg=NONE guibg=#25242b
hi CursorIM gui=NONE guifg=NONE guibg=#25242b
hi TermCursor gui=NONE guifg=NONE guibg=#25242b
hi TermCursorNC gui=NONE guifg=NONE guibg=#25242b
hi Error gui=NONE guifg=red guibg=NONE
hi ErrorMsg gui=NONE guifg=red guibg=NONE
hi vimUserFunc gui=NONE guifg=NONE guibg=NONE
hi vimTodo gui=NONE guifg=#25242b guibg=#f47855
hi zigDummyVariable gui=NONE guifg=NONE guibg=NONE
hi zigVarDecl gui=bold guifg=#7259e0 guibg=NONE
hi zigExecution gui=bold guifg=#7259e0 guibg=NONE
hi luaTable gui=NONE guifg=NONE guibg=NONE
