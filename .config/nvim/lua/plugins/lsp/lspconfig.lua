return {
	'neovim/nvim-lspconfig',
	requires = { 'williamboman/nvim-lsp-installer' },
	ft = { 'cpp', 'c', 'rust', 'sh', 'tex', 'python', 'lua', 'html', 'css', 'json', 'java', 'dart', 'php' },
	wants = { 'nvim-cmp', 'nvim-treesitter', 'nvim-lsp-installer' },
	config = function()
		local servers = { 'ccls', 'pyright', 'rust_analyzer', 'bashls', 'cssls', 'html', 'phpactor', 'sumneko_lua', 'tsserver' }
		local lsp = require('lspconfig')

		require('nvim-lsp-installer').setup({ ensure_installed = servers })

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
		local on_attach = function()

			local opts = { noremap = true, silent = true, buffer = true }

			vim.keymap.set('n', '<leader>lgD', vim.lsp.buf.declaration,             opts)
			vim.keymap.set('n', '<leader>lgd', vim.lsp.buf.definition,              opts)
			vim.keymap.set('n', '<leader>ll',  vim.lsp.buf.hover,                   opts)
			vim.keymap.set('n', '<leader>lgi', vim.lsp.buf.implementation,          opts)
			vim.keymap.set('n', '<leader>ls',  vim.lsp.buf.signature_help,          opts)
			vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder,    opts)
			vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set('n', '<leader>lD',  vim.lsp.buf.type_definition,         opts)
			vim.keymap.set('n', '<leader>lr',  vim.lsp.buf.rename,                  opts)
			vim.keymap.set('n', '<leader>lc',  vim.lsp.buf.code_action,             opts)
			vim.keymap.set('n', '<leader>lgr', vim.lsp.buf.references,              opts)
			vim.keymap.set('n', '<leader>le',  vim.diagnostic.open_float,           opts)
			vim.keymap.set('n', '<leader>lj',  vim.diagnostic.goto_prev,            opts)
			vim.keymap.set('n', '<leader>lk',  vim.diagnostic.goto_next,            opts)
			vim.keymap.set('n', '<leader>lq',  vim.diagnostic.setloclist,           opts)
			vim.keymap.set('n', '<leader>lf',  vim.lsp.buf.formatting,              opts)
		end

		for _, server in pairs(servers) do
			local setup_table = {
				capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
				on_attach = on_attach,
				flags = {
					debounce_text_changes = 150,
				}
			}
			if server == 'sumneko_lua' then
				--setup_table.settings.Lua.workspace.library = vim.api.nvim_get_runtime_file("", true)
			end
			lsp[server].setup(setup_table)
		end
	end
}
