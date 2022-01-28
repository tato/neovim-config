local M = {}

-- move to the window in a direction. if there is no window in that
-- direction, create a new one.
-- this function can only take as argument "h", "j", "k" or "l"
function M.move(direction)
    local nr = vim.fn.winnr()
    vim.cmd("wincmd "..direction)
    if vim.fn.winnr() == nr then
        vim.cmd("wincmd n")
        vim.cmd("wincmd "..string.upper(direction))
    end
end

return M
