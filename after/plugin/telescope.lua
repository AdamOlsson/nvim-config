local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>q', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>r', builtin.lsp_references, {})

vim.keymap.set('n', '<leader>Fs', function ()
    builtin.live_grep({ default_text = vim.fn.expand('<cword>') })
end ,{ noremap= true, silent=true })
