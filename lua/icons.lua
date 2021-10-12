local icons_enabled = true

local M = {}

local nvim_web_devicons_loaded, nvim_web_devicons = pcall(require, "nvim-web-devicons")
nvim_web_devicons.setup { default = true }
nvim_web_devicons.set_icon {
    help = { icon="", color="#eeeeee", name="help" },
    vimwiki = { icon="ﴬ ", color="#eeeeee", name="vimwiki" }
}

if not nvim_web_devicons_loaded then
    icons_enabled = false
end


function M.get_filetype_icon(name, ft)
    local icon = ""
    if icons_enabled then
        icon = nvim_web_devicons.get_icon(name, ft)
        if icon == "" then
            icon = ""
        else
            icon = icon.." "
        end
    end
    return icon
end

local _icons = {
    [true] = {
        separator_left = "",
        separator_right = "",
        soft_separator_left = "",
        soft_separator_right = "",
        readonly = "",
        help = "",
        branch = " ",
        added = "+",
        -- added = " ",
        -- added = " ",
        modified = "~",
        -- modified = "柳",
        -- modified = " ",
        removed = "-",
        -- removed = " ",
        -- removed = " ",
        errors = "",
        warnings = "",
        info = "",
        tips = ""
    },
    [false] = {
        separator_left = "/",
        separator_right = "/",
        soft_separator_left = "/",
        soft_separator_right = "/",
        readonly = "[RO]",
        help = "[HELP]",
        branch = "",
        added = "+",
        modified = "~",
        removed = "-",
        errors = "",
        warnings = "",
        info = "",
        tips = ""
    }
}

function M.get_icon(name)
    return _icons[icons_enabled][name]
end

function M.is_enabled()
    return icons_enabled
end

return M

