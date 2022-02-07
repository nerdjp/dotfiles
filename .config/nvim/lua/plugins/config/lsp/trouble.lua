return {
	'folke/trouble.nvim',
	after = 'nvim-lspconfig',
	config = function()
		require('trouble').setup{}
		local function keymap(...) vim.api.nvim_set_keymap(...) end
		local opts = { noremap = true, silent = true }
		keymap('n', '<leader>t', '<cmd>TroubleToggle workspace_diagnostics<CR>', opts)
	end
}
