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


function M.configure_gruvbox()
    -- i have no idea why this has a new line at the start
    if vim.cmd("colorscheme") == "\ngruvbox" then
        return
    end

    vim.g.gruvbox_bold = 1
    vim.g.gruvbox_italic = 0
    vim.g.gruvbox_transparent_bg = 1
    vim.g.gruvbox_underline = 1
    vim.g.gruvbox_undercurl = 1
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.gruvbox_contrast_light = "hard"
    vim.g.gruvbox_italicize_strings = 0
    vim.g.gruvbox_improved_strings = 1

    vim.cmd("colorscheme gruvbox")
end

return M
