require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua", stop_after_first = true },
        python = { "isort", "black", lsp_format = "fallback" },
        rust = { "rustfmt", lsp_format = "fallback", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
    },
})
