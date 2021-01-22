" ligma.vim -- Vim color scheme.
" Author:      Pablo Tato Ramos (pabtatoramos@gmail.com)
" Webpage:     https://pta.to
" Description: bluish, powerful & minimal

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "ligma"

if ($TERM =~ '256' || &t_Co >= 256) || has("gui_running")
    hi Normal ctermbg=255 ctermfg=0 cterm=NONE guibg=#eeeeee guifg=#000000 gui=NONE

    set background=light

    hi NonText ctermbg=255 ctermfg=8 cterm=NONE guibg=#eeeeee guifg=#808080 gui=NONE
    hi Comment ctermbg=255 ctermfg=24 cterm=NONE guibg=#eeeeee guifg=#005f87 gui=NONE
    hi Constant ctermbg=255 ctermfg=31 cterm=bold guibg=#eeeeee guifg=#0087af gui=bold
    hi Identifier ctermbg=255 ctermfg=0 cterm=NONE guibg=#eeeeee guifg=#000000 gui=NONE
    hi PreProc ctermbg=255 ctermfg=0 cterm=bold guibg=#eeeeee guifg=#000000 gui=bold
    hi Special ctermbg=255 ctermfg=0 cterm=bold guibg=#eeeeee guifg=#000000 gui=bold
    hi Statement ctermbg=255 ctermfg=0 cterm=bold guibg=#eeeeee guifg=#000000 gui=bold
    hi String ctermbg=255 ctermfg=31 cterm=NONE guibg=#eeeeee guifg=#0087af gui=NONE
    hi Todo ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi Type ctermbg=255 ctermfg=31 cterm=bold guibg=#eeeeee guifg=#0087af gui=bold
    hi Underlined ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi StatusLine ctermbg=24 ctermfg=15 cterm=bold guibg=#005f87 guifg=#ffffff gui=bold
    hi StatusLineNC ctermbg=7 ctermfg=0 cterm=NONE guibg=#c0c0c0 guifg=#000000 gui=NONE
    hi VertSplit ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi TabLine ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi TabLineFill ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi TabLineSel ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi Title ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi CursorLine ctermbg=24 ctermfg=15 cterm=NONE guibg=#005f87 guifg=#ffffff gui=NONE
    hi helpLeadBlank ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi helpNormal ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi Visual ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi VisualNOS ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi Pmenu ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi PmenuSbar ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi PmenuSel ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi PmenuThumb ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi FoldColumn ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi Folded ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi WildMenu ctermbg=39 ctermfg=0 cterm=NONE guibg=#00afff guifg=#000000 gui=NONE
    hi SpecialKey ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi DiffAdd ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi DiffChange ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi DiffDelete ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi DiffText ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi Search ctermbg=39 ctermfg=0 cterm=NONE guibg=#00afff guifg=#000000 gui=NONE
    hi Directory ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi MatchParen ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi SpellBad ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE guisp=#ff0000
    hi SpellCap ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE guisp=#0000ff
    hi SpellLocal ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE guisp=#ff00ff
    hi SpellRare ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE guisp=#00ffff
    hi ColorColumn ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi SignColumn ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi ErrorMsg ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi ModeMsg ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi MoreMsg ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi Question ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi Cursor ctermbg=0 ctermfg=15 cterm=NONE guibg=#000000 guifg=#ffffff gui=NONE
    hi QuickFixLine ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi StatusLineTerm ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE
    hi StatusLineTermNC ctermbg=15 ctermfg=8 cterm=NONE guibg=#ffffff guifg=#808080 gui=NONE

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16

    hi Normal ctermbg=white ctermfg=black cterm=NONE

    set background=light

    hi NonText ctermbg=white ctermfg=darkgray cterm=NONE
    hi Comment ctermbg=white ctermfg=darkblue cterm=NONE
    hi Constant ctermbg=white ctermfg=blue cterm=bold
    hi Identifier ctermbg=white ctermfg=black cterm=NONE
    hi PreProc ctermbg=white ctermfg=black cterm=bold
    hi Special ctermbg=white ctermfg=black cterm=bold
    hi Statement ctermbg=white ctermfg=black cterm=bold
    hi String ctermbg=white ctermfg=blue cterm=NONE
    hi Todo ctermbg=white ctermfg=darkgray cterm=NONE
    hi Type ctermbg=white ctermfg=blue cterm=bold
    hi Underlined ctermbg=white ctermfg=darkgray cterm=NONE
    hi StatusLine ctermbg=darkblue ctermfg=white cterm=bold
    hi StatusLineNC ctermbg=gray ctermfg=black cterm=NONE
    hi VertSplit ctermbg=white ctermfg=darkgray cterm=NONE
    hi TabLine ctermbg=white ctermfg=darkgray cterm=NONE
    hi TabLineFill ctermbg=white ctermfg=darkgray cterm=NONE
    hi TabLineSel ctermbg=white ctermfg=darkgray cterm=NONE
    hi Title ctermbg=white ctermfg=darkgray cterm=NONE
    hi CursorLine ctermbg=darkblue ctermfg=white cterm=NONE
    hi helpLeadBlank ctermbg=white ctermfg=darkgray cterm=NONE
    hi helpNormal ctermbg=white ctermfg=darkgray cterm=NONE
    hi Visual ctermbg=white ctermfg=darkgray cterm=NONE
    hi VisualNOS ctermbg=white ctermfg=darkgray cterm=NONE
    hi Pmenu ctermbg=white ctermfg=darkgray cterm=NONE
    hi PmenuSbar ctermbg=white ctermfg=darkgray cterm=NONE
    hi PmenuSel ctermbg=white ctermfg=darkgray cterm=NONE
    hi PmenuThumb ctermbg=white ctermfg=darkgray cterm=NONE
    hi FoldColumn ctermbg=white ctermfg=darkgray cterm=NONE
    hi Folded ctermbg=white ctermfg=darkgray cterm=NONE
    hi WildMenu ctermbg=cyan ctermfg=black cterm=NONE
    hi SpecialKey ctermbg=white ctermfg=darkgray cterm=NONE
    hi DiffAdd ctermbg=white ctermfg=darkgray cterm=NONE
    hi DiffChange ctermbg=white ctermfg=darkgray cterm=NONE
    hi DiffDelete ctermbg=white ctermfg=darkgray cterm=NONE
    hi DiffText ctermbg=white ctermfg=darkgray cterm=NONE
    hi Search ctermbg=cyan ctermfg=black cterm=NONE
    hi Directory ctermbg=white ctermfg=darkgray cterm=NONE
    hi MatchParen ctermbg=white ctermfg=darkgray cterm=NONE
    hi SpellBad ctermbg=white ctermfg=darkgray cterm=NONE
    hi SpellCap ctermbg=white ctermfg=darkgray cterm=NONE
    hi SpellLocal ctermbg=white ctermfg=darkgray cterm=NONE
    hi SpellRare ctermbg=white ctermfg=darkgray cterm=NONE
    hi ColorColumn ctermbg=white ctermfg=darkgray cterm=NONE
    hi SignColumn ctermbg=white ctermfg=darkgray cterm=NONE
    hi ErrorMsg ctermbg=white ctermfg=darkgray cterm=NONE
    hi ModeMsg ctermbg=white ctermfg=darkgray cterm=NONE
    hi MoreMsg ctermbg=white ctermfg=darkgray cterm=NONE
    hi Question ctermbg=white ctermfg=darkgray cterm=NONE
    hi Cursor ctermbg=black ctermfg=white cterm=NONE
    hi QuickFixLine ctermbg=white ctermfg=darkgray cterm=NONE
    hi StatusLineTerm ctermbg=white ctermfg=darkgray cterm=NONE
    hi StatusLineTermNC ctermbg=white ctermfg=darkgray cterm=NONE
endif

hi link Number Constant
hi link LineNr Normal
hi link CursorLineNr CursorLine
hi link IncSearch Search
hi link WarningMsg Error
hi link CursorColumn CursorLine

let g:terminal_ansi_colors = [
        \ '#000000',
        \ '#800000',
        \ '#008000',
        \ '#808000',
        \ '#000080',
        \ '#800080',
        \ '#008080',
        \ '#c0c0c0',
        \ '#808080',
        \ '#ff0000',
        \ '#00ff00',
        \ '#ffff00',
        \ '#0000ff',
        \ '#ff00ff',
        \ '#00ffff',
        \ '#ffffff',
        \ ]

" Generated with RNB (https://gist.github.com/romainl/5cd2f4ec222805f49eca)
