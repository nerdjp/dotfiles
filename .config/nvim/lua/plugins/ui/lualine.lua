return {
	'nvim-lualine/lualine.nvim',
	requires = { 'hyazdani42/nvim-web-devicons', opt = true },
	config = function ()
		require('lualine').setup()
	end,
}
