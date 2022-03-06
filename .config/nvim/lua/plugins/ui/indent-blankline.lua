return {
	'lukas-reineke/indent-blankline.nvim',
	after = 'nvim-lspconfig',
	config = function()
		require('indent_blankline').setup {
			buftype_exclude = {'terminal'},
			use_treesitter = true,
			space_char_blankline = " ",
			show_current_context = true,
			show_current_context_start = true,
		}
	end
}
