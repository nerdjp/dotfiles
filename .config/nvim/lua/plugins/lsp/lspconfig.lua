return {
	'neovim/nvim-lspconfig',
	ft = { 'cpp', 'c', 'rust', 'sh', 'tex', 'python', 'lua', 'html', 'css', 'json', 'java', 'dart', 'php' },
	wants = { 'nvim-cmp', 'nvim-treesitter', 'nvim-lsp-installer' },
	config = function()
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
		  local hl = "DiagnosticSign" .. type
		  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

	end
}
