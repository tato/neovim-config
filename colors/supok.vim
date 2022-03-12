
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
hi Statement gui=bold guifg=#b79ef7 guibg=NONE
hi Type gui=bold guifg=#b79ef7 guibg=NONE
hi StorageClass gui=bold guifg=#b79ef7 guibg=NONE
hi Structure gui=bold guifg=#b79ef7 guibg=NONE
hi Typedef gui=bold guifg=#b79ef7 guibg=NONE
hi PreProc gui=bold guifg=#b79ef7 guibg=NONE
hi Title gui=bold guifg=#b79ef7 guibg=NONE
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
hi Cursor gui=reverse guifg=NONE guibg=NONE
hi lCursor gui=reverse guifg=NONE guibg=NONE
hi CursorIM gui=reverse guifg=NONE guibg=NONE
hi TermCursor gui=reverse guifg=NONE guibg=NONE
hi TermCursorNC gui=reverse guifg=NONE guibg=NONE
hi Error gui=NONE guifg=#E01A4F guibg=NONE
hi ErrorMsg gui=NONE guifg=#E01A4F guibg=NONE
hi Visual gui=NONE guifg=#141411 guibg=#EEF6EF
hi VisualNOS gui=NONE guifg=#141411 guibg=#EEF6EF
hi Search gui=NONE guifg=#141411 guibg=#FBCD37
hi Substitute gui=NONE guifg=#141411 guibg=#FBCD37
hi IncSearch gui=NONE guifg=#141411 guibg=#FBCD37
hi MatchParen gui=NONE guifg=#141411 guibg=#FBCD37
hi DiffAdd gui=NONE guifg=#141411 guibg=#62AAE4
hi DiffChange gui=NONE guifg=#141411 guibg=#FBCD37
hi DiffDelete gui=NONE guifg=#141411 guibg=#E01A4F
hi DiffText gui=NONE guifg=#EEF6EF guibg=#141411
hi StatusLine gui=NONE guifg=#EEF6EF guibg=#141411
hi StatusLineNC gui=NONE guifg=#EEF6EF guibg=#141411
hi vimUserFunc gui=NONE guifg=NONE guibg=NONE
hi zigDummyVariable gui=NONE guifg=NONE guibg=NONE
hi zigVarDecl gui=bold guifg=#b79ef7 guibg=NONE
hi zigExecution gui=bold guifg=#b79ef7 guibg=NONE
hi zigEscape gui=NONE guifg=#60C0B0 guibg=NONE
hi zigBuiltinFn gui=italic guifg=#B8BEB8 guibg=NONE
hi luaTable gui=NONE guifg=NONE guibg=NONE
let g:supok_colors = {}
let g:supok_colors.white = '#EEF6EF'
let g:supok_colors.white_2 = '#B8BEB8'
let g:supok_colors.white_3 = '#818580'
let g:supok_colors.black = '#141411'
let g:supok_colors.blue = '#62AAE4'
let g:supok_colors.red = '#E01A4F'
let g:supok_colors.green = '#5DD57B'
let g:supok_colors.aqua = '#60C0B0'
let g:supok_colors.purple = '#b79ef7'
let g:supok_colors.yellow = '#FBCD37'
