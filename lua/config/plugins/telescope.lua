return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			require('telescope').setup {
				pickers = {
					find_files = {
						theme = "ivy",
					},
				},
				extensions = {
					fzf = {}
				},
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					}
				}
			}

			require('telescope').load_extension('fzf')
			local map = vim.keymap.set

			map("n", "<leader>fd", require('telescope.builtin').find_files, { desc = "Find files" })
			map("n", "<leader>en", function()
				require('telescope.builtin').find_files {
					cwd = vim.fn.stdpath("config")
				}
			end, { desc = "Open nvim config folder" })

			local builtin = require('telescope.builtin')
			map("n", "<leader>pws", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end, { desc = "Find word (chars only)" })

			map("n", "<leader>pWs", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end, { desc = "Find word (with special chars" })

			map("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end, { desc = "Find in files " })

			map("n", "<leader>fb", builtin.buffers, { desc = "List open buffers" })

			require "config.telescope.multigrep".setup()
		end

	}
}
