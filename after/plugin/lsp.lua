local lspconfig = require('lspconfig')

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = args.buf })
            -- vim.keymap.set('n', '<leader>th', function()
            -- end, '[T]oggle Inlay [H]ints')
          end
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

<<<<<<< Updated upstream
-- Add the .wgsl filetype to nvim so that we can attach the wgsl lsp
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})
lspconfig.wgsl_analyzer.setup {}


lspconfig.clangd.setup{}
=======
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.jsonls.setup {
  capabilities = capabilities,
}


lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
>>>>>>> Stashed changes
