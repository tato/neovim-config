-- TODO: autoconfigure colors from colorscheme

local galaxyline = require("galaxyline")
local condition = require("galaxyline.condition")
local provider_vcs = require("galaxyline.provider_vcs")

galaxyline.short_line_list = {"LuaTree","vista","dbui"}

local icons = require("icons")

local gruvbox_dark_palette = {
    black_0 = "#1d2021",
    black_1 = "#3c3836",
    black_2 = "#504945",
    black_3 = "#665c54",
    black_4 = "#7c6f64",
    black_5 = "#928374",
    white_0 = "#fbf1c7",
    white_1 = "#ebdbb2",
    white_2 = "#d5c5a1",
    white_3 = "#bdae93",
    white_4 = "#a89984",
    white_5 = "#a89984",
    bg = "#1d2021",
    fg = "#ebdbb2",
    red_bg = "#cc241d",
    red_fg = "#fb4934",
    green_bg = "#98971a",
    green_fg = "#b8bb26",
    yellow_bg = "#d79921",
    yellow_fg = "#fabd2f",
    blue_bg = "#458588",
    blue_fg = "#83a598",
    purple_bg = "#b16286",
    purple_fg = "#d3869b",
    aqua_bg = "#689d6a",
    aqua_fg = "#8ec07c"
}
local palette = gruvbox_dark_palette;

local colors = {
    mode_fg = palette.black_0,
    mode_bg = palette.white_0,
    c_bg = palette.white_3,
    c_fg = palette.black_0,
    b_bg = palette.white_2,
    b_fg = palette.black_0,
    padding = palette.black_5
}


local function filename_provider()
    local modified = ""
    if vim.bo.modified then
        modified = "*"
    end

    local ret = nil
    if vim.bo.filetype == "help" then
        ret = " "..vim.fn.expand("%:t")..modified
    else
        ret = " "..vim.fn.expand("%:~:.")..modified
    end
    return ret
end

local function condition_has_filename()
    return vim.fn.expand("%:t") ~= ""
end

galaxyline.section.left[1] = {
    ViMode = {
        provider = function()
            local short_to_full = {
                n = "NORMAL", no = "NORMAL", nov = "NORMAL", noV = "NORMAL",
                ["no^V"] = "NORMAL", niI = "NORMAL", niR = "NORMAL", niV = "NORMAL",
                v = "VISUAL", V = "VISUAL", [""] = "VISUAL",
                s = "SELECT", S = "SELECT", [""] = "SELECT",
                i = "INSERT", ic = "INSERT", ix = "INSERT",
                R = "REPLACE", Rc = "REPLACE", Rv = "REPLACE", Rx = "REPLACE",
                c = "COMMAND", cv = "COMMAND", ce = "COMMAND",
                r = "PROMPT", rm = "PROMPT", ["r?"] = "PROMPT",
                ["!"] = "SHELL", t = "TERMINAL"
            }

            local mode_to_color = {
                NORMAL = "aqua",
                VISUAL = "purple", SELECT = "purple",
                INSERT = "yellow",
                REPLACE = "green",
                COMMAND = "blue", PROMPT = "blue", SHELL = "blue",
                TERMINAL = "green"
            }

            local mode = short_to_full[vim.fn.mode()]
            local color = mode_to_color[mode]

            local color_fg = palette[color.."_fg"]
            local color_bg = palette[color.."_bg"]

            vim.cmd("hi ViModeSeparator guibg="..color_fg)
            vim.cmd("hi GalaxyFileName guibg="..color_fg)
            vim.cmd("hi FileNameSeparator guifg="..color_fg.." guibg="..color_bg)
            vim.cmd("hi GalaxyFileInfo guibg="..color_bg)
            vim.cmd("hi GalaxyFileType guibg="..color_fg)
            vim.cmd("hi FileTypeSeparator guifg="..color_fg.." guibg="..color_bg)
            vim.cmd("hi GitInfoSeparator guibg="..color_fg)

            local padding = ""
            for _ = 0, 8 - string.len(mode) do
                padding = padding.." "
            end
            return padding..mode
        end,
        separator = icons.get_icon("separator_left"),
        separator_highlight = { colors.mode_bg, palette.red_fg },
        highlight = { colors.mode_fg, colors.mode_bg, "bold" },
    },
}

galaxyline.section.left[2] = {
    FileName = {
        provider = filename_provider,
        condition = condition_has_filename,
        separator = icons.get_icon("separator_left"),
        separator_highlight = { palette.white_2, palette.white_4 },
        highlight = { palette.black_0, palette.white_2, "bold" },
    }
}

galaxyline.section.left[3] = {
    FileInfo = {
        provider = {
            function()
                local extra = ""
                if vim.bo.readonly then
                    extra = extra.." [RO]"
                end
                if vim.bo.fileformat ~= "unix" then
                    extra = extra.." ["..vim.bo.fileformat.."]"
                end
                return extra
            end,
            "LinePercent",
            "FileSize",
        },
        condition = condition_has_filename,
        highlight = { palette.black_0, palette.white_4 },
    }
}

galaxyline.section.right[1] = {
    FileType = {
        provider = function()
            local ft = vim.bo.filetype
            local name = vim.fn.expand("%:t")
            local icon = icons.get_filetype_icon(name, ft)
            return icon..ft.." "
        end,
        condition = condition_has_filename,
        separator = icons.get_icon("separator_right"),
        separator_highlight = { colors.white_4, palette.white_2 },
        highlight = { palette.black_0, palette.white_4 },
    }
}

galaxyline.section.right[2] = {
    GitInfo = {
        provider = {
            function() return icons.get_icon("branch") end,
            "GitBranch",
            function()
                local res = ""

                local added = provider_vcs.diff_add()
                if added ~= nil then
                    res = res..icons.get_icon("added")..added
                end

                local modified = provider_vcs.diff_modified()
                if modified ~= nil then
                    res = res..icons.get_icon("modified")..modified
                end

                local remove = provider_vcs.diff_remove()
                if remove ~= nil then
                    res = res..icons.get_icon("removed")..remove
                end

                if res ~= "" then
                    res = " "..res
                else
                    res = nil
                end
                return res
            end
        },
        condition = function()
            return provider_vcs.get_git_branch() ~= nil
        end,
        separator = icons.get_icon("separator_right"),
        separator_highlight = { colors.mode_bg, palette.white_4 },
        highlight = { colors.mode_fg, colors.mode_bg, "bold" },
    }
}

galaxyline.section.short_line_left[1] = {
    BufferType = {
        provider = filename_provider,
        condition = condition_has_filename,
        separator = icons.get_icon("separator_left"),
        separator_highlight = { palette.black_4, palette.black_2 },
        highlight = { palette.white_2, palette.black_4 },
    }
}


galaxyline.section.short_line_right[1] = {
    BufferIcon = {
        provider= 'BufferIcon',
        condition = condition_has_filename,
        separator = icons.get_icon("separator_right"),
        separator_highlight = { palette.black_4, palette.black_2 },
        highlight = { palette.white_2, palette.black_4 },
    }
}

