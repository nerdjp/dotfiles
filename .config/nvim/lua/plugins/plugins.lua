vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    autocmd BufWritePost config/*.lua source <afile> | PackerSync
    autocmd BufWritePost config/**/*.lua source <afile> | PackerSync
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').init {
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

	--Programming
	use(require('plugins.config.lsp.cmp'))
	use(require('plugins.config.lsp.flutter-tools'))
	use(require('plugins.config.lsp.gps'))
	--use(require('plugins.config.lsp.lsp_signature'))
	use(require('plugins.config.lsp.lspconfig'))
	use(require('plugins.config.lsp.playground'))
	use(require('plugins.config.lsp.treesitter'))
	use(require('plugins.config.lsp.trouble'))
	use(require('plugins.config.lsp.lsp-installer'))

	use(require('plugins.config.lsp.yuck'))

	--Debugging
	use(require('plugins.config.dap.dap'))
	use(require('plugins.config.dap.dap-ui'))

	--Utility
	use(require('plugins.config.util.autopairs'))
	use(require('plugins.config.util.telescope'))
	use(require('plugins.config.util.hop'))
	use(require('plugins.config.util.registers'))
	use(require('plugins.config.util.which-key'))
	use(require('plugins.config.util.tree'))

	--UI
	use(require('plugins.config.ui.barbar'))
	use(require('plugins.config.ui.galaxyline'))
	use(require('plugins.config.ui.indent-blankline'))
	use(require('plugins.config.ui.colorizer'))
	use(require('plugins.config.ui.dressing'))
	

	if packer_bootstrap then
		require('packer').sync()
	end
end)
