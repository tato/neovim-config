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

import types
colors = types.SimpleNamespace()
colors.white = "#EEF6EF"
colors.white_2 = "#B8BEB8"
colors.white_3 = "#818580"
colors.black = "#141411"
colors.blue = "#62AAE4"
colors.red = "#E01A4F"
colors.green = "#5DD57B"
colors.aqua = "#60C0B0"
colors.purple = "#CB6DEE"
colors.purple = "#b79ef7"
colors.yellow = "#FBCD37"

background = colors.black
background_light = background
foreground = colors.white
foreground_dark = colors.white_2
foreground_darker = colors.white_3
primary_color = colors.purple
secondary_color = colors.aqua
highlight_color = background

default = ["NONE", foreground, background]
grey = ["NONE", foreground_dark, "NONE"]
greyer = ["NONE", foreground_darker, "NONE"]
primary = ["bold", primary_color, "NONE"]
secondary = ["NONE", secondary_color, "NONE"]
highlight = ["NONE", "NONE", highlight_color]
disabled = ["NONE", "NONE", "NONE"]
cursor = ["reverse", "NONE", "NONE"]
error = ["NONE", colors.red, "NONE"]

# :help highlight-default :help group-name
# TODO: ModeMsg, MsgArea, MsgSeparator, MoreMsg,
# Pmenu, PmenuSel, PmenuSbar, PmenuThumb, Question, QuickFixLine,
# SpecialKey, SpellBad, SpellCap, SpellLocal, SpellRare, StatusLine,
# TabLine, TabLineFill, TabLineSel
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
    "Pmenu": [greyer[0], greyer[1], background_light],

    "Statement": primary,
    # "Type": [primary[0], colors.blue, primary[2]],
    "Type": primary,
    "StorageClass": primary,
    "Structure": primary,
    "Typedef": primary,
    "PreProc": primary,
    "Title": primary,

    "Constant": secondary,
    "String": [secondary[0], colors.green, secondary[2]],
    "SpecialChar": secondary,
    "Directory": secondary,
    "CursorLineNr": [secondary[0], colors.yellow, highlight[2]],

    "Todo": ["underline", colors.red, background],

    "ColorColumn":  highlight,
    "CursorColumn": highlight,
    "CursorLine":   highlight,

    "Operator":   disabled,
    "Delimiter":  disabled,
    "Special":    disabled,
    "FoldColumn": disabled,
    "SignColumn": disabled,

    "Cursor":       cursor,
    "lCursor":      cursor,
    "CursorIM":     cursor,
    "TermCursor":   cursor,
    "TermCursorNC": cursor,

    "Error":    error,
    "ErrorMsg": error,

    "Visual":    ["NONE", background, foreground],
    "VisualNOS": ["NONE", background, foreground],

    "Search":     ["NONE", background, colors.yellow],
    "Substitute": ["NONE", background, colors.yellow],
    "IncSearch":  ["NONE", background, colors.yellow],
    "MatchParen": ["NONE", background, colors.yellow],

    "DiffAdd":    ["NONE", background, colors.blue],
    "DiffChange": ["NONE", background, colors.yellow], 
    "DiffDelete": ["NONE", background, colors.red],
    "DiffText": default, 

    "StatusLine":   ["NONE", foreground, background],
    "StatusLineNC": ["NONE", foreground, background],

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

    f.write("let g:supok_colors = {}\n")
    for name, color in colors.__dict__.items():
        f.write(f"let g:supok_colors.{name} = '{color}'\n")

        
