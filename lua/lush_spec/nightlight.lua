local lush = require "lush"
local hsluv = lush.hsluv

local red = hsluv "#f6768d"
local green = hsluv "#5DD57B"
local yellow = hsluv "#FBCD37".lighten(20)

return lush(function()
    return {
        Normal { bg=hsluv(270, 30, 1), fg=hsluv(260, 15, 100), },
        NormalFloat { bg=Normal.bg.lighten(20), fg=Normal.fg },

        Identifier { fg=Normal.fg },
        Comment { fg=Normal.fg.darken(30) },
        Conceal { fg=Normal.fg.darken(30).desaturate(50) },
        Folded { Conceal },
        LineNr { Conceal },
        LineNrAbove { Conceal },
        LineNrBelow { Conceal },
        NonText { bg=Conceal.bg, fg=Conceal.fg.darken(60) },
        VertSplit { NonText },
        Pmenu { gui=Conceal.gui, bg=Normal.bg, fg=Conceal.fg },

        Statement { gui="", fg=hsluv(260, 90, 60) },
        StorageClass { Statement },
        Structure { Statement },
        TypeDef { Statement },
        PreProc { Statement },
        Title { Statement },

        Type {  gui="", fg=hsluv(150, 70, 80) },
        String { bg=hsluv(260, 70, 10) },
        Constant { fg=hsluv(100, 70, 85) },
        SpecialChar { Constant },
        Directory { Constant },

        Todo { fg=red },
        WarningMsg { Todo },
        MoreMsg { Type },

        ColorColumn { bg=Normal.bg.lighten(2) },
        CursorColumn { bg=Normal.bg.lighten(2) },
        CursorLine { bg=Normal.bg.lighten(2) },
        CursorLineNr { fg=Statement.fg, bg=CursorLine.bg },

        Operator { Comment },
        Delimiter { Operator },
        Special { Operator },
        FoldColumn { Operator },
        SignColumn { Operator },

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

        DiffAdd { bg=green, fg=Normal.bg },
        DiffChange { bg=yellow, fg=Normal.bg },
        DiffDelete { bg=red, fg=Normal.bg },
        DiffText { Normal },
        diffAdded { DiffAdd },
        diffChanged { DiffChange },
        diffRemoved { DiffDelete },

        StatusLine { bg=Normal.fg, fg=Normal.bg },
        StatusLineNC { bg=Normal.fg.darken(40), fg=Normal.bg },
        TabLine{ StatusLineNC },
        TabLineFill{ StatusLineNC },
        TabLineSel{ StatusLine },

        -- vim
        vimUserFunc { },

        -- lua
        luaTable { Operator },

        -- zig
        zigVarDecl { StorageClass },
    }
end)
