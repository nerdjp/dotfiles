return {
	'williamboman/nvim-lsp-installer',
	require = 'neovim/nvim-lspconfig',
	after = 'nvim-lspconfig',
	config = function()
		local lsp_installer = require('nvim-lsp-installer')

		lsp_installer.on_server_ready(function(server)
			local opts = {}

			server:setup(opts)
		end)
	end
}
