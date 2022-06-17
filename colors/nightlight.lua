-- BSD Zero Clause License
-- 
-- Copyright (c) 2022 Pablo Tato Ramos
-- 
-- Permission to use, copy, modify, and/or distribute this software for any
-- purpose with or without fee is hereby granted.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
-- REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
-- AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
-- INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
-- LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
-- OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
-- PERFORMANCE OF THIS SOFTWARE.

vim.opt.background = "dark"
vim.g.colors_name = "nightlight"
local lush = require("lush")
local hsluv = lush.hsluv

local blue    = hsluv("#62AAE4")
local red     = hsluv("#f6768d")
local green = hsluv("#9fd06d")
local other_green   = hsluv("#5DD57B")
local aqua    = hsluv("#60C0B0")
local purple  = hsluv("#b79ef7")
local yellow  = hsluv("#FBCD37").lighten(20)

local theme = lush(function()
    return {
        Normal { bg=hsluv(270, 70, 1), fg=hsluv(260, 50, 100), },
        -- Normal { bg=hsluv(270, 70, 1), fg=hsluv(260, 50, 90), },
        VertSplit { Normal },

        Identifier { fg=Normal.fg.darken(20) },

        Comment { fg=Normal.fg.darken(30).desaturate(50) },
        Conceal { Comment },
        Folded { Comment },
        LineNr { Comment },
        LineNrAbove { Comment },
        LineNrBelow { Comment },
        NonText { bg=Comment.bg, fg=Comment.fg.darken(60) },
        Pmenu { gui=Comment.gui, bg=Normal.bg, fg=Comment.fg },

        Statement { gui="bold", fg=blue },
        Type { Statement },
        StorageClass { Statement },
        Structure { Statement },
        TypeDef { Statement },
        PreProc { Statement },
        Title { Statement },

        Constant { fg=aqua },
        String { fg=green },
        SpecialChar { Constant },
        Directory { Constant },
        CursorLineNr { bg=Normal.bg, fg=yellow, },

        Todo { gui="underline", bg=Normal.bg, fg=red },

        ColorColumn { bg=Normal.bg },
        CursorColumn { bg=Normal.bg },
        CursorLine { bg=Normal.bg },

        Operator { },
        Delimiter { },
        Special { },
        FoldColumn { },
        SignColumn { },

        Cursor { gui="reverse" },
        lCursor { Cursor },
        CursorIM { Cursor },
        TermCursor { Cursor },
        TermCursorNC { Cursor },

        Error { fg=red },
        ErrorMsg { fg=red },

        Visual { bg=Normal.fg, fg=Normal.bg },
        VisualNOS { Visual },

        Search { bg=yellow, fg=Normal.bg },
        Substitute { Search },
        IncSearch { Search },
        MatchParen { Search },

        DiffAdd { bg=blue, fg=Normal.bg },
        DiffChange { bg=yellow, fg=Normal.bg },
        DiffDelete { bg=red, fg=Normal.bg },
        DiffText { Normal },
        diffAdded { DiffAdd },
        diffChanged { DiffChange },
        diffRemoved { DiffDelete },

        StatusLine { bg=Normal.fg.darken(20), fg=Normal.bg },
        StatusLineNC { bg=Normal.fg, fg=Normal.bg },
        TabLine{ StatusLineNC },
        TabLineFill{ StatusLineNC },
        TabLineSel{ StatusLine },

        -- vim
        vimUserFunc { },

        -- zig (via zig.vim)
        zigDummyVariable { },
        zigVarDecl { Statement },
        zigExecution { Statement },
        zigEscape { Constant },
        zigBuiltinFn { fg=Normal.fg.darken(20) },

        -- lua
        luaTable { },
    }
end)

lush(theme)
