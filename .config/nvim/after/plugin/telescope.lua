local builtin = require('telescope.builtin')

-- Files 
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>F', builtin.git_files, {})
-- Grep
-- strict grep
vim.keymap.set('n', '<leader>A', builtin.live_grep, {})
-- fuzzy search 
vim.keymap.set('n', 
                '<leader>a', 
                function()
                    builtin.grep_string{
                        shorten_path = true, word_match = "-w", only_sort_text = true, search = ''
                    }
                end,
                {})
-- Buffers
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
-- LSP
vim.keymap.set('n', '<localleader>lr', builtin.lsp_references, {})

require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous"
			}
		}
	}
}

