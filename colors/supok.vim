
" BSD Zero Clause License
" 
" Copyright (c) 2022 Pablo Tato Ramos
" 
" Permission to use, copy, modify, and/or distribute this software for any
" purpose with or without fee is hereby granted.
" 
" THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
" REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
" AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
" INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
" LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
" OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
" PERFORMANCE OF THIS SOFTWARE.


set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "supok"

hi Visual gui=NONE guifg=#141411 guibg=#EEF6EF
hi VisualNOS gui=NONE guifg=#141411 guibg=#EEF6EF
hi Search gui=NONE guifg=#141411 guibg=#FBCD37
hi Substitute gui=NONE guifg=#141411 guibg=#FBCD37
hi IncSearch gui=NONE guifg=#141411 guibg=#FBCD37
hi MatchParen gui=NONE guifg=#141411 guibg=#FBCD37
hi Normal gui=NONE guifg=#EEF6EF guibg=#141411
hi VertSplit gui=NONE guifg=#EEF6EF guibg=#141411
hi Identifier gui=NONE guifg=#B8BEB8 guibg=NONE
hi Comment gui=NONE guifg=#818580 guibg=NONE
hi Conceal gui=NONE guifg=#818580 guibg=NONE
hi Folded gui=NONE guifg=#818580 guibg=NONE
hi LineNr gui=NONE guifg=#818580 guibg=NONE
hi LineNrAbove gui=NONE guifg=#818580 guibg=NONE
hi LineNrBelow gui=NONE guifg=#818580 guibg=NONE
hi NonText gui=NONE guifg=#818580 guibg=NONE
hi Pmenu gui=NONE guifg=#818580 guibg=#141411
hi Statement gui=bold guifg=#CB6DEE guibg=NONE
hi Type gui=bold guifg=#CB6DEE guibg=NONE
hi StorageClass gui=bold guifg=#CB6DEE guibg=NONE
hi Structure gui=bold guifg=#CB6DEE guibg=NONE
hi Typedef gui=bold guifg=#CB6DEE guibg=NONE
hi PreProc gui=bold guifg=#CB6DEE guibg=NONE
hi Title gui=bold guifg=#CB6DEE guibg=NONE
hi Constant gui=NONE guifg=#60C0B0 guibg=NONE
hi String gui=NONE guifg=#5DD57B guibg=NONE
hi SpecialChar gui=NONE guifg=#60C0B0 guibg=NONE
hi Directory gui=NONE guifg=#60C0B0 guibg=NONE
hi CursorLineNr gui=NONE guifg=#FBCD37 guibg=#141411
hi Todo gui=underline guifg=#E01A4F guibg=#141411
hi ColorColumn gui=NONE guifg=NONE guibg=#141411
hi CursorColumn gui=NONE guifg=NONE guibg=#141411
hi CursorLine gui=NONE guifg=NONE guibg=#141411
hi Operator gui=NONE guifg=NONE guibg=NONE
hi Delimiter gui=NONE guifg=NONE guibg=NONE
hi Special gui=NONE guifg=NONE guibg=NONE
hi FoldColumn gui=NONE guifg=NONE guibg=NONE
hi SignColumn gui=NONE guifg=NONE guibg=NONE
hi Cursor gui=NONE guifg=NONE guibg=#141411
hi lCursor gui=NONE guifg=NONE guibg=#141411
hi CursorIM gui=NONE guifg=NONE guibg=#141411
hi TermCursor gui=NONE guifg=NONE guibg=#141411
hi TermCursorNC gui=NONE guifg=NONE guibg=#141411
hi Error gui=NONE guifg=red guibg=NONE
hi ErrorMsg gui=NONE guifg=red guibg=NONE
hi vimUserFunc gui=NONE guifg=NONE guibg=NONE
hi zigDummyVariable gui=NONE guifg=NONE guibg=NONE
hi zigVarDecl gui=bold guifg=#CB6DEE guibg=NONE
hi zigExecution gui=bold guifg=#CB6DEE guibg=NONE
hi zigEscape gui=NONE guifg=#60C0B0 guibg=NONE
hi zigBuiltinFn gui=italic guifg=#B8BEB8 guibg=NONE
hi luaTable gui=NONE guifg=NONE guibg=NONE
