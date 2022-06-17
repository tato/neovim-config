local my_config = {}

-- move to the window in a direction. if there is no window in that
-- direction, create a new one.
-- this function can only take as argument "h", "j", "k" or "l"
function my_config.move(direction)
    local nr = vim.fn.winnr()
    vim.cmd("wincmd "..direction)
    if vim.fn.winnr() == nr then
        local splitbelow = vim.opt.splitbelow:get()
        local splitright = vim.opt.splitright:get()

        if direction == "h" then
            vim.opt.splitright = false
            vim.cmd("vsplit")
        elseif direction == "j" then
            vim.opt.splitbelow = true
            vim.cmd("split")
        elseif direction == "k" then
            vim.opt.splitbelow = false
            vim.cmd("split")
        elseif direction == "l" then
            vim.opt.splitright = true
            vim.cmd("vsplit")
        end

        vim.opt.splitbelow = splitbelow
        vim.opt.splitright = splitright
    end
end

return my_config
