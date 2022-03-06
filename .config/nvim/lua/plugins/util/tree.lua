return {
	'kyazdani42/nvim-tree.lua',
	requires = {'kyazdani42/nvim-tree.lua'},
	config = function()
		require('nvim-tree').setup {
			auto_close = true,
			diagnostics = {
				enable = true,
			},
			view = {
				auto_resize = true,
				width = 40,
			},
		}
		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		keymap('n', '<leader>n', '<cmd>NvimTreeFocus<cr>', opts)
	end
}
