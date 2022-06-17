local module = {}
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

local lspconfig = require("lspconfig")

function module.on_attach(client, bufnr) 
    local map = vim.api.nvim_set_keymap
    local bufmap = vim.api.nvim_buf_set_keymap
    local opts = { noremap=true, silent=true }

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

return module
