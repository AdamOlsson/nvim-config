local lspconfig = require('lspconfig')

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)

        -- if client.supports_method('textDocument/completion') then
        --     -- Enable auto-completion
        --     vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
        -- end

        vim.api.nvim_create_autocmd('BufWritePre', {
            -- group = get_augroup(client),
            buffer = args.buf,
            callback = function()
                require("conform").format({
                    bufnr = args.buf,
                    id = client.id
                })
            end
        })
    end,
})

-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#setup

lspconfig.lua_ls.setup {}

lspconfig.rust_analyzer.setup {
    settings = {
        imports = {
            group = {
                enable = false
            }
        }
    }
}

lspconfig.pyright.setup{}

-- Add the .wgsl filetype to nvim so that we can attach the wgsl lsp
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})
lspconfig.wgsl_analyzer.setup {}


lspconfig.clangd.setup{}
