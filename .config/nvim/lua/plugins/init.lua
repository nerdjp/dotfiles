vim.api.nvim_create_augroup('packer_user_config', { clear = true})
vim.api.nvim_create_autocmd('BufWritePost', {
	group = 'packer_user_config',
	pattern = '~/.config/nvim/lua/plugins/**.lua',
	command = 'source <afile> | PackerSync',
})

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	require('packer').sync()
end

require('packer').init {
	compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua',
	display = {
		open_fn = function()
			return require('packer.util').float {}
		end
	}
}

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Theme
	use(require('themes.tokyonight'))
	--use(require('themes.neon'))
	--use(require('themes.catppuccin'))

	--Programming
	use(require('plugins.lsp.lspconfig'))
	use(require('plugins.lsp.cmp'))
	use(require('plugins.lsp.flutter-tools'))
	use(require('plugins.lsp.treesitter'))
	use(require('plugins.lsp.playground'))

	--use(require('plugins.lsp.symbols-outline'))
	--use(require('plugins.lsp.gps'))
	--
	--Debugging
	use(require('plugins.dap.dap'))
	use(require('plugins.dap.dap-ui'))

	--Utility
	use(require('plugins.util.autopairs'))
	use(require('plugins.util.telescope'))
	use(require('plugins.util.registers'))
	use(require('plugins.util.which-key'))

	--UI
	--use(require('plugins.ui.barbar'))
	--use(require('plugins.ui.galaxyline'))
	use(require('plugins.ui.lualine'))
	use(require('plugins.ui.indent-blankline'))
	use(require('plugins.ui.colorizer'))
	use(require('plugins.ui.dressing'))
	--use(require('plugins.ui.beacon'))
	
	use {
		'j-hui/fidget.nvim',
		config = function ()
			require("fidget").setup()
		end
	}

end)
