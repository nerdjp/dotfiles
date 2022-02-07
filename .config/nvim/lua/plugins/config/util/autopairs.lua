return {
	'windwp/nvim-autopairs',
	after = 'nvim-lspconfig',
	config = function() 
		require('nvim-autopairs').setup{}
	end
}
