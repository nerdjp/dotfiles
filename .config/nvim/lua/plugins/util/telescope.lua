return {
	'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			local keymap = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }

			keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
			keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
			keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
			keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
		end
}
