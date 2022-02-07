return {
	'mfussenegger/nvim-dap',
	after = 'nvim-lspconfig',
	config = function()
		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		keymap('n', '<leader>ldb', '<cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
		keymap('n', '<leader>ldc', '<cmd>lua require("dap").continue()<CR>', opts)
		keymap('n', '<leader>lds', '<cmd>lua require("dap").step_over()<CR>', opts)
		keymap('n', '<F5>', '<cmd>lua require("dap").step_over()<CR>', opts)
		keymap('n', '<leader>ldS', '<cmd>lua require("dap").step_into()<CR>', opts)
		keymap('n', '<F6>', '<cmd>lua require("dap").step_into()<CR>', opts)

		local dap = require('dap')
		dap.adapters.cppdbg = {
			id = 'cppdbg',
			type = 'executable',
			command = '/home/nerdjp/.local/bin/cpp-dap/extension/debugAdapters/bin/OpenDebugAD7'
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
				  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = true,
			},
			{
				name = 'Attach to gdbserver :1234',
				type = 'cppdbg',
				request = 'launch',
				MIMode = 'gdb',
				miDebuggerServerAddress = 'localhost:1234',
				miDebuggerPath = '/usr/bin/gdb',
				cwd = '${workspaceFolder}',
				program = function()
				  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
			},
		}
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end
}
