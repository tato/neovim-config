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
vim.g.colors_name = "komi"
local lush = require("lush")
local hsluv = lush.hsluv

local theme = lush(function()
    return {
        Normal { bg=hsluv(0, 0, 0), fg=hsluv(0, 0, 90) },
        VertSplit { fg=Normal.fg.darken(50) },

        Identifier { Normal },

        Comment { fg=hsluv(250, 00, 50), gui="italic" },
        Conceal { Comment },
        Folded { Comment },
        LineNr { Comment },
        LineNrAbove { Comment },
        LineNrBelow { Comment },
        NonText { Comment },
        Pmenu { Comment },

        Statement { fg=hsluv(250, 75, 55) },
        Type { Statement },
        StorageClass { Statement },
        Structure { Statement },
        TypeDef { Statement },
        PreProc { Statement },
        Title { Statement },

        Constant { fg=hsluv(150, 70, 90) },
        String { Constant },
        SpecialChar { Constant },
        Directory { Constant },
        CursorLineNr { Constant },

        Todo { fg=hsluv(50, 100, 80), gui="underline bold" },

        CursorLine { bg=Normal.bg.lighten(20) },
        ColorColumn { CursorLine },
        CursorColumn { CursorLine },

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

        Error { },
        ErrorMsg { },

        Visual { bg=Normal.fg, fg=Normal.bg },
        VisualNOS { Visual },

        Search { bg=hsluv(200, 100, 92), fg=Normal.bg },
        Substitute { Search },
        IncSearch { Search },
        MatchParen { Search },

        DiffText { },
        DiffAdd { bg=hsluv(120, 100, 94), fg=Normal.bg },
        DiffChange { bg=hsluv(70, 100, 90), fg=Normal.bg },
        DiffDelete { bg=hsluv(20, 100, 76), fg=Normal.bg },
        diffAdded { DiffAdd },
        diffChanged { DiffChange },
        diffRemoved { DiffDelete },

        StatusLine { bg=Normal.fg, fg=Normal.bg },
        StatusLineNC { bg=Normal.fg.darken(50), fg=Normal.bg },

        -- treesitter
        TSConstBuiltin { Constant },
        TSTodo { Todo },
        TSType { fg=Type.fg.lighten(45) },
        -- TSTypeBuiltin { TSType },
        TSTypeQualifier { TSType },

        -- vim
        vimUserFunc { },

        -- zig (via zig.vim)
        zigDummyVariable { },
        zigVarDecl { Statement },
        zigExecution { Statement },
        zigEscape { Constant },
        zigBuiltinFn {  },

        -- lua
        luaTable { },
    }
end)

lush(theme)
