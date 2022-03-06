return {
	'simrat39/symbols-outline.nvim',
	after = {'nvim-lspconfig'},
	config = function()
		vim.api.nvim_set_keymap('n', '<leader>ls', '<cmd>SymbolsOutline<CR>', {noremap = true, silent = true})
	end
}
