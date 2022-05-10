return {
	'mfussenegger/nvim-dap',
	after = 'nvim-lspconfig',
	config = function()
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		keymap('n', '<leader>ldb', require("dap").toggle_breakpoint, opts)
		keymap('n', '<leader>ldc', require("dap").continue, opts)
		keymap('n', '<leader>lds', require("dap").step_over, opts)
		keymap('n', '<F5>', require("dap").step_over, opts)
		keymap('n', '<leader>ldS', require("dap").step_into, opts)
		keymap('n', '<F6>', require("dap").step_into, opts)

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
