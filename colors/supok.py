LICENSE = """
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
"""
# This license applies both to this generator program and the
# generated vim colorscheme file

foreground = "#dad6ff" 
foreground_dark = "#a7a4c3"
background = "#25242b"
background_light = "#45444b"

default = ["NONE", foreground, background]
grey = ["NONE", foreground_dark, "NONE"]
greyer = ["NONE", "#656565", "NONE"]
primary = ["bold", "#7c5ffc", "NONE"]
secondary = ["NONE", "#f9c236", "NONE"]
highlight = ["NONE", "NONE", "#3C3836"]
disabled = ["NONE", "NONE", "NONE"]
cursor = ["NONE", "NONE", background_light]
error = ["NONE", "red", "NONE"]

# :help highlight-default :help group-name
# TODO: Special
# TODO: DiffAdd, DiffChange, DiffDelete, DiffText, FoldColumn, SignColumn,
# IncSearch, Substitute, MatchParen, ModeMsg, MsgArea, MsgSeparator, MoreMsg,
# Pmenu, PmenuSel, PmenuSbar, PmenuThumb, Question, QuickFixLine, Search,
# SpecialKey, SpellBad, SpellCap, SpellLocal, SpellRare, StatusLine,
# StatusLineNC, TabLine, TabLineFill, TabLineSel, Title, Visual, VisualNOS,
# WarningMsg, Whitespace, 
groups = {
    "Normal": default,
    "VertSplit": default,

    "Identifier": grey,

    "Comment": greyer,
    "Conceal": greyer,
    "Folded": greyer,
    "LineNr": greyer,
    "LineNrAbove": greyer,
    "LineNrBelow": greyer,
    "NonText": greyer,

    "Statement": primary,
    "Type": primary,
    "PreProc": primary,

    "Constant": secondary,
    "Todo": secondary,
    "Directory": secondary,
    "CursorLineNr": [secondary[0], secondary[1], highlight[2]],

    "ColorColumn": highlight,
    "CursorColumn": highlight,
    "CursorLine": highlight,

    "Operator": disabled,
    "Delimiter": disabled,

    "Cursor": cursor,
    "lCursor": cursor,
    "CursorIM": cursor,
    "TermCursor": cursor,
    "TermCursorNC": cursor,

    "Error": error,
    "ErrorMsg": error,

    # vim
    "vimUserFunc": disabled,

    # zig (via zig.vim)
    "zigDummyVariable": default,
    "zigVarDecl": primary,
    "zigExecution": primary,
}

boilerplate = """
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "supok"
"""

with open("supok.vim", "w", newline="") as f:
    f.write(LICENSE)
    f.write("\n")
    f.write(boilerplate)
    f.write("\n")

    for group, [gui, fg, bg] in groups.items():
        f.write(f"hi {group} gui={gui} guifg={fg} guibg={bg}\n")
        
