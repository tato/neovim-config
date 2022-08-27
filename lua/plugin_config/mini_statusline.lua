local st = require("mini.statusline")

local my_filename_section = function (args) 
    if vim.bo.buftype == "terminal" then
        return "%t"
    end

    local extra = ""
    if vim.opt.modified:get() then
        extra = extra.."*"
    end
    if vim.opt.readonly:get() then
        extra = extra.." RO"
    end
        
    if st.is_truncated(args.trunc_width) then
        return "%f"..extra
    else
        return "%F"..extra
    end
end

local my_size_section = function()
    local bytes = vim.fn.eval("getfsize(expand(@%))")
    local sizes = { "B", "KB", "MB", "GB" }
    local i = 1
    while bytes >= 1024.0 do
        bytes = bytes / 1024.0
        i = i + 1
    end
    if bytes > 0 then
        return vim.fn.printf("%.1f%s", bytes, sizes[i]) .. " │"
    else
        return ""
    end
end

local percent_section = function(args)
    -- TODO: len == 2 if not trunc, len == 1 if trunc
    local curr = vim.fn.line(".")
    local last = vim.fn.line("$")
    if     curr == 0         then return "  "
    elseif curr * 8 < last   then return "▁▁"
    elseif curr * 4 < last   then return "▂▂" 
    elseif curr/3 * 8 < last then return "▃▃"
    elseif curr * 2 < last   then return "▄▄"
    elseif curr/5 * 8 < last then return "▅▅" 
    elseif curr/6 * 8 < last then return "▆▆" 
    elseif curr/7 * 8 < last then return "▇▇" 
    else return "██"
    end
end

local my_mode_name = function()
    local mode = vim.fn.mode()
    if     vim.startswith(mode, "n") then return "NORMAL"
    elseif vim.startswith(mode, "v") then return "VISUAL"
    elseif vim.startswith(mode, "V") then return "V-LINE"
    elseif vim.startswith(mode, "s") then return "SELECT"
    elseif vim.startswith(mode, "S") then return "S-LINE"
    elseif vim.startswith(mode, "i") then return "INSERT"
    elseif vim.startswith(mode, "R") then return "R-MODE"
    elseif vim.startswith(mode, "c") then return "VIMCMD"
    elseif vim.startswith(mode, "r") then return "PROMPT"
    elseif vim.startswith(mode, "!") then return "SHELL "
    elseif vim.startswith(mode, "t") then return "TERM  "
    else                                  return "      "
    end
end

local active = function()
    local mode, mode_hl = st.section_mode({ trunc_width = 75 })
    local git = st.section_git({ trunc_width = 90 })
    local diagnostics = st.section_diagnostics({ trunc_width = 75 })
    local filename = my_filename_section({ trunc_width = 120 })
    local percent = percent_section({ trunc_width = 120 });

    return st.combine_groups {
        { hl = mode_hl, strings = { "" } }, "▊",
        { strings = { my_mode_name() } },

        { hl = "StatusLine", strings = { filename } },
        "%<", -- Mark general truncate point
        { strings = {  "│", my_size_section(), "%l:%c" } },
        "%=", -- End left alignment
        -- TODO { strings = { git, diagnostics } },

        percent,
    }
end

local inactive = function()
    local filename = st.section_filename({ trunc_width = 80 })
    local fileinfo = st.section_fileinfo({ trunc_width = 80 })
    return st.combine_groups {
        "▊",
        { strings = { filename }},
        { strings = {  "│", my_size_section(), "%l:%c" } },
    }
end

vim.cmd[[
au VimEnter * ++once hi link MiniStatuslineModeNormal  Cursor
au VimEnter * ++once hi link MiniStatuslineModeInsert  DiffChange
au VimEnter * ++once hi link MiniStatuslineModeVisual  DiffAdd
au VimEnter * ++once hi link MiniStatuslineModeReplace DiffDelete
au VimEnter * ++once hi link MiniStatuslineModeCommand DiffText
au VimEnter * ++once hi link MiniStatuslineModeOther   IncSearch

au VimEnter * ++once hi link MiniStatuslineDevinfo  StatusLine
au VimEnter * ++once hi link MiniStatuslineFilename StatusLine
au VimEnter * ++once hi link MiniStatuslineFileinfo StatusLine
au VimEnter * ++once hi link MiniStatuslineInactive StatusLineNC
]]

return {
    -- content = {
    --     active = active,
    --     inactive = inactive,
    -- },
}
