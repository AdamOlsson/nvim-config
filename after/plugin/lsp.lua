local lsp = require('lspconfig')

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
    end,
})

