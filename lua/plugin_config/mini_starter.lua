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
    table.insert(bookmarks, bookmark("Tiny Habitat", "c:/code/tiny_habitat"))
end

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
