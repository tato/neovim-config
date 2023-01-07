local starter = require("mini.starter")

local bookmarks = {}
local bookmark = function(name, path)
    return {
        name = name,
        action = "cd "..path.." | e .",
        section = "Bookmarks",
    }
end

table.insert(bookmarks, bookmark("Config folder", vim.fn.stdpath("config")))

if vim.fn.hostname() == "BASE" then
    table.insert(bookmarks, bookmark("code", "c:/code"))
    table.insert(bookmarks, bookmark("monky garden", "d:/monky garden"))
    table.insert(bookmarks, bookmark("gamedev", "c:/gamedev"))
end

vim.cmd[[
au VimEnter * ++once hi link MiniStarterCurrent    CursorLine
au VimEnter * ++once hi link MiniStarterFooter     Type
au VimEnter * ++once hi link MiniStarterHeader     Type
au VimEnter * ++once hi link MiniStarterInactive   Comment
au VimEnter * ++once hi link MiniStarterItem       Normal
au VimEnter * ++once hi link MiniStarterItemBullet Normal
au VimEnter * ++once hi link MiniStarterItemPrefix Statement
au VimEnter * ++once hi link MiniStarterSection    Delimiter
au VimEnter * ++once hi link MiniStarterQuery      Search
]]

return {
    header = "🦇 NEOVIIIIIIIIIIIIIIM 🦇",
    footer = "<C-c> closes this buffer",
    items = {
        {
            name = "Edit new buffer",
            action = "enew",
            section = "Actions",
        },
        {
            name = "Git (via Fugitive)",
            action = "0Git",
            section = "Actions",
        },
        {
            name = "Telescope",
            action = "Telescope",
            section = "Actions",
        },
        {
            name = "Quit vim",
            action = "quit",
            section = "Actions",
        },
        bookmarks,
    },
    content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning("center", "center"),
    },
}
