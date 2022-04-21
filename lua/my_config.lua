local M = {}

-- move to the window in a direction. if there is no window in that
-- direction, create a new one.
-- this function can only take as argument "h", "j", "k" or "l"
function M.move(direction)
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

        vim.cmd("enew")

        vim.opt.splitbelow = splitbelow
        vim.opt.splitright = splitright
    end
end

-- # lsp notes:
--
-- ## vim.diagnostic.* functions that are a bit interesting
--  vim.diagnostic.goto_prev  vim.diagnostic.goto_next   vim.diagnostic.open_float
--  vim.diagnostic.toqflist   vim.diagnostic.fromqflist  vim.diagnostic.setqflist 
--  vim.diagnostic.setloclist
-- 
-- ## todo lspconfig: 
--  * workflows for compiling/running/testing a project
--  * rename symbol that actually works
--  * go to definition/declaration/usages that actually works
--
-- ## todo coq (completion):
--  * more consistent trigger completion
--    * I would love <TAB> but I think it isn't possible because VIM is ancient trash
--    * I got used to doing ctrl-n because ctrl-x+ctrl-o is so annoying
--  * don't suggest "BUF" completions (aka word completion)
function M.setup_lsp()
    local lspconfig = require("lspconfig")
    local coq = require("coq")
    vim.g.coq_settings = { 
        ["clients.snippets.warn"] = {},
        ["display.icons.mode"] = "none",
    }

    local map = vim.api.nvim_set_keymap
    local bufmap = vim.api.nvim_buf_set_keymap
    local opts = { noremap=true, silent=true }

    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        bufmap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        bufmap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        bufmap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        bufmap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        bufmap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        bufmap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        bufmap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        -- bufmap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        bufmap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        bufmap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

    local servers = { "zls" }
    for _, lsp in pairs(servers) do
        lspconfig[lsp].setup(coq.lsp_ensure_capabilities{ on_attach = on_attach, })
    end
end


return M
