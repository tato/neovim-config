local lush = require('lush')
local hsluv = lush.hsluv

local nl = require("lush_colorscheme.nightlight")

return lush(function()
    return {
        Normal { bg=hsluv(0, 0, 99), fg=hsluv(0, 0, 0)},
        VertSplit { Normal },

        Identifier { fg=Normal.fg.lighten(20) },
        Comment { fg=hsluv(180, 35, 50) },
        Conceal { fg=Normal.fg.lighten(30).desaturate(50) },
        Folded { Conceal },
        LineNr { Conceal },
        LineNrAbove { Conceal },
        LineNrBelow { Conceal },
        NonText { bg=Conceal.bg, fg=Conceal.fg.darken(60) },
        Pmenu { gui=Conceal.gui, bg=Normal.bg, fg=Conceal.fg },

        Statement { gui="bold", fg=hsluv(260, 80, 40) },
        Type { },
        StorageClass { Statement },
        Structure { Statement },
        TypeDef { Statement },
        PreProc { Statement },
        Title { Statement },

        String { bg=hsluv(210, 55, 90) },
        Constant { gui="bold", fg=hsluv(230, 100, 60)},
        SpecialChar { Constant },
        Directory { Constant },
        CursorLineNr {Constant },

     --    Todo { gui="underline", bg=Normal.bg, fg=red },

        ColorColumn { bg=Normal.bg.darken(20) },
        CursorColumn { bg=Normal.bg.darken(20) },
        CursorLine { bg=Normal.bg.darken(20) },

        Operator { fg="NONE", bg="NONE", gui="NONE" },
        Delimiter { Operator },
        Special { Operator },
        FoldColumn { Operator },
        SignColumn { Operator },

        Cursor { bg=hsluv(0,0,0), fg=hsluv(0,0,100) },
        lCursor { Cursor },
        CursorIM { Cursor },
        TermCursor { Cursor },
        TermCursorNC { Cursor },

     --    Error { fg=red },
     --    ErrorMsg { fg=red },

     --    Visual { bg=Normal.fg, fg=Normal.bg },
     --    VisualNOS { Visual },

     --    Search { bg=yellow, fg=Normal.bg },
     --    Substitute { Search },
     --    IncSearch { Search },
     --    MatchParen { Search },

     --    DiffAdd { bg=other_green, fg=Normal.bg },
     --    DiffChange { bg=yellow, fg=Normal.bg },
     --    DiffDelete { bg=red, fg=Normal.bg },
     --    DiffText { Normal },
     --    diffAdded { DiffAdd },
     --    diffChanged { DiffChange },
     --    diffRemoved { DiffDelete },

     --    StatusLine { bg=Normal.fg.darken(20), fg=Normal.bg },
     --    StatusLineNC { bg=Normal.fg, fg=Normal.bg },
     --    TabLine{ StatusLineNC },
     --    TabLineFill{ StatusLineNC },
     --    TabLineSel{ StatusLine },

     --    -- vim
     --    vimUserFunc { },

     --    -- zig (via zig.vim)
     --    zigDummyVariable { },
     --    zigVarDecl { Statement },
     --    zigExecution { Statement },
     --    zigEscape { Constant },
     --    zigBuiltinFn { fg=Normal.fg.darken(20) },

     --    -- lua
     --    luaTable { },

     --    -- mini.starter
     --    MiniStarterCurrent {},
     --    -- MiniStarterFooter {},
     --    -- MiniStarterHeader {},
     --    -- MiniStarterInactive {},
     --    -- MiniStarterItem {},
     --    -- MiniStarterItemBullet {},
     --    -- MiniStarterItemPrefix {},
     --    -- MiniStarterSection {},
     --    -- MiniStarterQuery {},
    }-- 
end)
