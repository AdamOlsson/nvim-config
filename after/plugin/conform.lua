require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua", stop_after_first = true },
        python = { "isort", "black", lsp_format = "fallback" },
        rust = { "rustfmt", lsp_format = "fallback", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
<<<<<<< Updated upstream
        cpp = { "clang_format", stop_after_first = true }
=======
        json = { "fixjson", lsp_format = "fallback", stop_after_first = true }
>>>>>>> Stashed changes
    },

    formatters = {
        clang_format = {
            prepend_args = { "--style=file", "--fallback-style=LLVM" }
        }
    }
})
