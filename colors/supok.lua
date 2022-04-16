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
vim.g.colors_name = "supok"
local lush = require("lush")
local hsluv = lush.hsluv

local white   = hsluv("#EEF6EF")
local white_2 = hsluv("#B8BEB8")
local white_3 = hsluv("#818580")
local black   = hsluv("#141411")
local blue    = hsluv("#62AAE4")
local red     = hsluv("#E01A4F")
local green   = hsluv("#5DD57B")
local aqua    = hsluv("#60C0B0")
local purple  = hsluv("#b79ef7")
local yellow  = hsluv("#FBCD37")

local theme = lush(function()
    return {
        Normal { bg=black, fg=white, },
        VertSplit { Normal },

        Identifier { fg=white_2 },

        Comment { fg=white_3 },
        Conceal { Comment },
        Folded { Comment },
        LineNr { Comment },
        LineNrAbove { Comment },
        LineNrBelow { Comment },
        NonText { Comment },
        Pmenu { gui=Comment.gui, bg=black, fg=Comment.fg },

        Statement { gui="bold", fg=purple },
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
        CursorLineNr { bg=black, fg=yellow, },

        Todo { gui="underline", bg=black, fg=red },

        ColorColumn { bg=black },
        CursorColumn { bg=black },
        CursorLine { bg=black },

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

        StatusLine { bg=Normal.fg, fg=Normal.bg },
        StatusLineNC { bg=white_2, fg=Normal.bg },

        -- vim
        vimUserFunc { },

        -- zig (via zig.vim)
        zigDummyVariable { },
        zigVarDecl { Statement },
        zigExecution { Statement },
        zigEscape { Constant },
        zigBuiltinFn { fg=white_2 },

        -- lua
        luaTable { },
    }
end)

lush(theme)
