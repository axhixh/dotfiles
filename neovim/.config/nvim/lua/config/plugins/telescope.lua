return {
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- fuzzy finder
			-- needs `make` to build; will only load if `make` is available
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			}
		},
		config = function()
			local telescope = require('telescope')
			telescope.setup {
				defaults = {
					mappings = {
						i = {
							['<C-u>'] = false,
							['<C-d>'] = false,
						},
					},
				},
			}
			-- Enable telescope fzf native if installed
			pcall(telescope.load_extension, 'fzf')

			-- builtins; see `:help telescope.builtin`
			local builtin = require('telescope.builtin')
			local kmap = vim.keymap
			kmap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
			kmap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
			kmap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
			kmap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
			kmap.set('n', '<leader>/', function()
				builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end, { desc = '[/] Fuzzy search in current buffer' })
		end
	}
}
