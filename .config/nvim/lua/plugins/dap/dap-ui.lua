return {
	'rcarriga/nvim-dap-ui',
	requires = 'mfussenegger/nvim-dap',
	after = 'nvim-dap',
	config = function()
		require('dapui').setup()
	end
}
