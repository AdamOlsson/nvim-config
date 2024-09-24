require("mason").setup({
    ui = {
        icons = {
            package_installed = "[]",
            package_pending = "[]",
            package_uninstalled = "[]",
        },
    }
})
require("mason-lspconfig").setup({
    ensured_installed = { "lua_ls", "rust_analyzer", "pyright", "rust_analyzer" }
})

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function ()
        require("rust-tools").setup {
            server = {
                on_attach = function(_, bufnr)
                    -- Hover actions
                    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                    -- Code action groups
                    vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                end,
            },

        }
    end
}
