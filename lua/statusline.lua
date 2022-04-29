local m = {}

function m.modified()
    if vim.opt.modified:get() then return "*" end
    return ""
end

function m.readonly()
    if vim.opt.readonly:get() then return " RO" end
    return ""
end

function m.mode()
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

function m.size()
    local bytes = vim.fn.eval("getfsize(expand(@%))")
    local sizes = { "B", "KB", "MB", "GB" }
    local i = 1
    while bytes >= 1024.0 do
        bytes = bytes / 1024.0
        i = i + 1
    end
    if bytes > 0 then
        return vim.fn.printf("%.1f%s", bytes, sizes[i])
    else
        return ""
    end
end

function m.percent()
    local curr = vim.fn.line(".")
    local last = vim.fn.line("$")
    if     curr == 0         then return " "
    elseif curr * 8 < last   then return "▁"
    elseif curr * 4 < last   then return "▂" 
    elseif curr/3 * 8 < last then return "▃"
    elseif curr * 2 < last   then return "▄"
    elseif curr/5 * 8 < last then return "▅" 
    elseif curr/6 * 8 < last then return "▆" 
    elseif curr/7 * 8 < last then return "▇" 
    else return "█"
    end
end

function m.setup()
    local sl = "▊"
    sl = sl.." %{luaeval(\"require('statusline').mode()\")} "
    sl = sl.." %t"
    sl = sl.."%{luaeval(\"require('statusline').modified()\")} "
    sl = sl.."%{luaeval(\"require('statusline').readonly()\")} "
    sl = sl.." %{luaeval(\"require('statusline').size()\")} │"
    sl = sl.." %l:%c"

    sl = sl.."%="
    sl = sl.."%{FugitiveStatusline()}"
    sl = sl.." %{luaeval(\"require('statusline').percent()\")}"

    vim.opt.statusline = sl
    return sl
end

return m
