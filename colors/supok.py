LICENSE = """
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
"""
# This license applies both to this generator program and the
# generated vim colorscheme file

white = "#EEF6EF"
white_2 = "#B8BEB8"
white_3 = "#818580"
black = "#141411"
blue = "#62AAE4"
red = "#E01A4F"
green = "#5DD57B"
aqua = "#60C0B0"
purple = "#CB6DEE"
yellow = "#FBCD37"

background = black
background_light = background
foreground = white
foreground_dark = white_2
foreground_darker = white_3
primary_color = purple
secondary_color = aqua
highlight_color = background

default = ["NONE", foreground, background]
grey = ["NONE", foreground_dark, "NONE"]
greyer = ["NONE", foreground_darker, "NONE"]
primary = ["bold", primary_color, "NONE"]
secondary = ["NONE", secondary_color, "NONE"]
highlight = ["NONE", "NONE", highlight_color]
disabled = ["NONE", "NONE", "NONE"]
cursor = ["NONE", "NONE", background_light]
error = ["NONE", "red", "NONE"]

# :help highlight-default :help group-name
# TODO: DiffAdd, DiffChange, DiffDelete, DiffText, 
# ModeMsg, MsgArea, MsgSeparator, MoreMsg,
# Pmenu, PmenuSel, PmenuSbar, PmenuThumb, Question, QuickFixLine,
# SpecialKey, SpellBad, SpellCap, SpellLocal, SpellRare, StatusLine,
# StatusLineNC, TabLine, TabLineFill, TabLineSel
# WarningMsg, Whitespace, 
groups = {
    "Visual": ["NONE", background, foreground],
    "VisualNOS": ["NONE", background, foreground],
    "Search": ["NONE", background, yellow],
    "Substitute": ["NONE", background, yellow],
    "IncSearch": ["NONE", background, yellow],
    "MatchParen": ["NONE", background, yellow],

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
    "Pmenu": [greyer[0], greyer[1], background_light],

    "Statement": primary,
    # "Type": [primary[0], blue, primary[2]],
    "Type": primary,
    "StorageClass": primary,
    "Structure": primary,
    "Typedef": primary,
    "PreProc": primary,
    "Title": primary,

    "Constant": secondary,
    "String": [secondary[0], green, secondary[2]],
    "SpecialChar": secondary,
    "Directory": secondary,
    "CursorLineNr": [secondary[0], yellow, highlight[2]],

    "Todo": ["underline", red, background],

    "ColorColumn": highlight,
    "CursorColumn": highlight,
    "CursorLine": highlight,

    "Operator": disabled,
    "Delimiter": disabled,
    "Special": disabled,
    "FoldColumn": disabled,
    "SignColumn": disabled,

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
    "zigDummyVariable": disabled,
    "zigVarDecl": primary,
    "zigExecution": primary,
    "zigEscape": secondary,
    "zigBuiltinFn": ["italic", grey[1], grey[2]],

    # lua
    "luaTable": disabled,
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
        
