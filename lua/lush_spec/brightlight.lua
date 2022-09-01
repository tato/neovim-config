local lush = require "lush"
local hsluv = lush.hsluv

local green = hsluv "#5DD57B"

return lush(function()
    return {
        Normal { bg=hsluv(260, 90, 92), fg=hsluv(270, 0, 1), },
        NormalFloat { bg=Normal.bg.darken(20), fg=Normal.fg },

        Identifier { fg=Normal.fg },
        Comment { fg=Normal.fg.lighten(30) },
        Conceal { fg=Normal.fg.lighten(30).desaturate(50) },
        Folded { Conceal },
        LineNr { Conceal },
        LineNrAbove { Conceal },
        LineNrBelow { Conceal },
        NonText { bg=Conceal.bg, fg=Conceal.fg.lighten(60) },
        VertSplit { NonText },
        Pmenu { gui=Conceal.gui, bg=Normal.bg, fg=Conceal.fg },

        Statement { gui="", fg=hsluv(270, 80, 40), gui="bold" },
        StorageClass { Statement },
        Structure { Statement },
        TypeDef { Statement },
        PreProc { Statement },
        Title { Statement },

        Type {  gui="", fg=hsluv(150, 100, 50) },
        String { bg=hsluv(160, 50, 80) },
        Constant { fg=hsluv(240, 100, 40), gui="underline" },
        SpecialChar { Constant },
        Directory { Constant },

        Todo { fg=hsluv(0, 80, 50), gui="BOLD" },
        WarningMsg { Todo },
        MoreMsg { Type },

        ColorColumn { bg=Normal.bg.lighten(5) },
        CursorColumn { bg=Normal.bg.lighten(5) },
        CursorLine { bg=Normal.bg.lighten(5) },
        CursorLineNr { fg=Statement.fg, bg=CursorLine.bg },

        -- Operator { fg="NONE", bg="NONE", gui="NONE" },
        -- Operator { fg=hsluv(260, 90, 90) },
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

        Error { fg=Todo.fg },
        ErrorMsg { fg=Todo.fg },

        Visual { bg=Normal.fg, fg=Normal.bg },
        VisualNOS { Visual },

        Search { bg=hsluv(70, 50, 90), fg=Normal.fg },
        Substitute { Search },
        IncSearch { Search },
        MatchParen { Search },

        DiffAdd { bg=hsluv(120, 90, 90), fg=Normal.fg },
        DiffChange { bg=hsluv(50, 90, 90), fg=Normal.fg },
        DiffDelete { bg=hsluv(0, 90, 80), fg=Normal.fg },
        DiffText { Normal },
        diffAdded { DiffAdd },
        diffChanged { DiffChange },
        diffRemoved { DiffDelete },

        StatusLine { bg=hsluv(0,0,20), fg=hsluv(0,0,80) },
        StatusLineNC { bg=hsluv(0,0,40), fg=hsluv(0, 0, 60) },
        TabLine{ StatusLineNC },
        TabLineFill{ StatusLineNC },
        TabLineSel{ StatusLine },

    }
end)
