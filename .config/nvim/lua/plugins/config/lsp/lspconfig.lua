return {
	'neovim/nvim-lspconfig',
	ft = { 'cpp', 'c', 'rust', 'sh', 'tex', 'python', 'lua', 'html', 'css', 'json', 'java', 'dart', 'php' },
	wants = { 'nvim-cmp', 'nvim-treesitter', 'lsp_signature.nvim' },
	config = function()
		local lsp = require('lspconfig')
		local function keymap(...) vim.api.nvim_set_keymap(...) end
		local function option(...) vim.api.nvim_set_option(...) end

		local opts = { noremap = true, silent = true }

		keymap('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
		keymap('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
		keymap('n', '<leader>ll', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		keymap('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
		keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
		keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
		keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
		keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
		keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
		keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		keymap('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
		keymap('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
		keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
		keymap('n', '<leader>lj', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
		keymap('n', '<leader>lk', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
		keymap('n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
		keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

		local on_attach = function(client, bufnr)
			require "lsp_signature".on_attach()
		end

		local servers = { 'clangd', 'texlab', 'rust_analyzer', 'pyright', 'jdtls', 'sumneko_lua', 'intelephense' }
		for _, server in ipairs(servers)  do
			lsp[server].setup {
				on_attach = on_attach,
				capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
				flags = {
					debounce_text_changes = 150,
				},
			}
		end
	end
}
