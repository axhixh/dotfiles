return {
	{
		'echasnovski/mini.nvim',
		config = function()
			-- replaces `nvim-tree/nvim-web-devicons`
			require('mini.icons').setup()
			-- replaces `nvim-lualine/lualine.nvim`
			require('mini.statusline').setup { use_icons = true }
			-- replaces `lukas-reineke/indent-blankline.nvim`
			require('mini.indentscope').setup()

			local miniclue = require('mini.clue')
			miniclue.setup({
				triggers = {
					-- Show clues when <Leader> is pressed
					{ mode = 'n', keys = '<Leader>' },
					{ mode = 'x', keys = '<Leader>' },
					-- Built-in completion
					{ mode = 'i', keys = '<C-x>' },
					-- `g` key
					{ mode = 'n', keys = 'g' },
					{ mode = 'x', keys = 'g' },
					-- Marks
					{ mode = 'n', keys = "'" },
					{ mode = 'n', keys = '`' },
					-- Registers
					{ mode = 'n', keys = '"' },
					{ mode = 'x', keys = '"' },
					-- Window commands
					{ mode = 'n', keys = '<C-w>' },
					-- `z` key
					{ mode = 'n', keys = 'z' },
					{ mode = 'x', keys = 'z' },
				},
				clues = {
					-- Enhance this by adding descriptions for <Leader> mapping groups
					miniclue.gen_clues.builtin_completion(),
					miniclue.gen_clues.g(),
					miniclue.gen_clues.marks(),
					miniclue.gen_clues.registers(),
					miniclue.gen_clues.windows(),
					miniclue.gen_clues.z(),
				},
				window = {
					-- Adjust the delay before showing clues (in milliseconds)
					delay = 200,
					-- Configure the appearance of the clue window
					config = function()
						local width = 40
						return {
							anchor = 'NW',
							width = width,
							row = 'auto',
							col = math.max(math.floor(0.5 * (vim.o.columns - width)), 0),
						}
					end,
				},

				-- support icons
				format = {
					icon = function(clue)
						local icon, _ = icons.get('filetype', clue)
						return icon
					end
				}
			})
		end
	}
}
