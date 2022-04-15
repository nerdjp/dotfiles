vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    autocmd BufWritePost *.lua source <afile> | PackerSync
    autocmd BufWritePost */*.lua source <afile> | PackerSync
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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
	--use(require('themes.tokyonight'))
	use(require('themes.catppuccin'))

	--Programming
	use(require('plugins.lsp.lspconfig'))
	use(require('plugins.lsp.cmp'))
	use(require('plugins.lsp.flutter-tools'))
	--use(require('plugins.lsp.gps'))
	--use(require('plugins.lsp.symbols-outline'))
	use(require('plugins.lsp.treesitter'))
	use(require('plugins.lsp.playground'))
	--use(require('plugins.lsp.trouble'))
	use(require('plugins.lsp.lsp-installer'))

	--Debugging
	use(require('plugins.dap.dap'))
	use(require('plugins.dap.dap-ui'))

	--Utility
	use(require('plugins.util.autopairs'))
	use(require('plugins.util.telescope'))
	--use(require('plugins.util.hop'))
	use(require('plugins.util.registers'))
	use(require('plugins.util.which-key'))
	--use(require('plugins.util.tree'))

	--UI
	use(require('plugins.ui.barbar'))
	use(require('plugins.ui.galaxyline'))
	use(require('plugins.ui.indent-blankline'))
	use(require('plugins.ui.colorizer'))
	use(require('plugins.ui.dressing'))
	

	if packer_bootstrap then
		require('packer').sync()
	end
end)
