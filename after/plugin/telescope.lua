local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>q', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>r', builtin.lsp_references, {})

vim.keymap.set('n', '<leader>Fs', function ()
    builtin.live_grep({ default_text = vim.fn.expand('<cword>') })
end ,{ noremap= true, silent=true })

-- Command to list binaries in ./build/bin and select them for lldb
vim.api.nvim_create_user_command('LLDBSelect', function()
    builtin.find_files({
        prompt_title = "Select Binary to Debug",
        cwd = "./build/bin/",
        attach_mappings = function(prompt_bufnr, map)
            local action_state = require('telescope.actions.state')
            local actions = require('telescope.actions')
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd('GdbStartLLDB lldb ./build/bin/' .. selection.value)
            end)
            return true
        end
    })
end, {})
vim.keymap.set('n', '<leader>ll', ':LLDBSelect<CR>', { noremap = true })
