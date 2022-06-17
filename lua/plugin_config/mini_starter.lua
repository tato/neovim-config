local starter = require("mini.starter")
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
        {   name = "Config folder",
            action = "cd ~/.config/nvim | e .",
            section = "Bookmarks",
        },
        {   name = "Tiny Habitat",
            action = "cd c:/code/tiny_habitat | e .",
            section = "Bookmarks",
        },
    },
    content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning("center", "center"),
    },
}
