vim.api.nvim_create_augroup('custom_exec', { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
	group = 'custom_exec',
	pattern = {"~/.config/i3/config"},
	command = '!i3-msg -q reload',
})

vim.api.nvim_create_autocmd('BufWritePre', {
	group = 'custom_exec',
	pattern = {'todo.txt'},
	command = 'sort',
})

vim.api.nvim_create_augroup('highlight_yank', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
	group = 'highlight_yank',
	callback = function ()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200})
	end,
})

