require('config.lazy')

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.fixeol = false -- avoid vim adding <EOL> at end of file
vim.opt.scrolloff = 8

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space><space>xx", function()
	if vim.bo.filetype == 'lua' then
		vim.cmd(":.lua")
	elseif vim.bo.filetype == 'sh' then
		local current_line_number = vim.api.nvim_win_get_cursor(0)[1]
		local current_line = vim.api.nvim_buf_get_lines(vim.api.nvim_get_current_buf(), current_line_number - 1,
			current_line_number, false)
		vim.cmd(":!echo \n")
		vim.cmd(':!eval ' .. current_line[1])
	end
end)

vim.keymap.set("n", "<space><space>jq", function()
	vim.cmd(":%!jq .")
end)
vim.keymap.set("v", "<space><space>jq", function()
	vim.cmd(":%!jq .")
end)
