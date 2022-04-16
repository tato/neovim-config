local m = {}

function m.modified()
    if vim.opt.modified:get() then
        return "*"
    end
    return ""
end

function m.mode()
    local mode = vim.fn.mode()
    if mode == "n" then
        return "NORMAL"
    else
        return "OTHER" -- TODO
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

function m.setup()
    local sl = ""
    sl = sl.."▊"
    sl = sl.." %{luaeval(\"require('statusline').mode()\")} "
    sl = sl.." %t"
    sl = sl.."%{luaeval(\"require('statusline').modified()\")} "
    -- TODO: readonly
    sl = sl.." %{luaeval(\"require('statusline').size()\")} │"
    sl = sl.." %l:%c"

    sl = sl.."%="
    -- TODO: git
    sl = sl.."│ %p"
    -- TODO: cool unicode percent


    vim.opt.statusline = sl
    return sl
end

return m
