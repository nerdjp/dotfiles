return {
	'akinsho/flutter-tools.nvim',
	requires = 'nvim-lua/plenary.nvim',
	wants = { 'nvim-cmp', 'nvim-treesitter', 'nvim-lspconfig', 'lsp_signature.nvim' },
	ft = { 'dart' },
	config = function()
		require("flutter-tools").setup{
			lsp = {
				on_attach = function(client, bufnr)
					require "lsp_signature".on_attach()
				end
			}
		}
		vim.o.tabstop = 2
		vim.o.expandtab = true
		local function keymap(...) vim.api.nvim_set_keymap(...) end
		local opts = { noremap = true, silent = true }
		keymap('n', '<F5>', '<cmd>FlutterRun<CR>', opts)
		keymap('n', '<F6>', '<cmd>FlutterRestart<CR>', opts)
		vim.cmd("autocmd BufWritePre *.dart execute ':lua vim.lsp.buf.formatting_sync()'")
	end
}
