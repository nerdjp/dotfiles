return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'Pocco81/Catppuccino.nvim',
		config = function()
			require'catppuccino'.colorscheme = "neon_latte" 
		end
	}
	use {
		'folke/tokyonight.nvim',
		config = function() 
			vim.g.tokyonight_style = "night"
			vim.cmd('colorscheme tokyonight')
		end
	}
	use {
		'neovim/nvim-lspconfig',
		config = function()

			local lsp = require'lspconfig'
			
			local on_attach = function(client, bufnr)
			--	local function keymap(...) vim.api.nvim_set_keymap(bufnr, ...) end
			--	local function option(...) vim.api.nvim_set_option(bufnr, ...) end

			-- local opts = { noremap = true, silent = true }

			--	keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
			--	keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
			--	keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
			--	keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
			--	keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
			--	keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
			--	keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
			--	keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
			--	keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
			--	keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
			--	keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
			--	keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
			--	keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
			--	keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
			--	keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
			--	keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
			--	keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

				require'completion'.on_attach()
				
			end

			local servers = { 'ccls', 'texlab', 'pyright' }

			for _, server in ipairs(servers)  do
				lsp[server].setup {
					on_attach = on_attach,
					flags = {
						debounce_text_changes = 150,
					}
				}
			end
		end
	}
	use { 
		'nvim-lua/completion-nvim',
		config = function()
			vim.o.completeopt = "menuone,noinsert,noselect"
			vim.cmd('set shortmess+=c')
			vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', {expr = true, noremap = true})
			vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', {expr = true, noremap = true})
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require'nvim-treesitter.configs'.setup {
			ensure_installed = "maintained",
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				}
			},
			indent = {
				enable = true
			}
		} end
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'jbyuki/nabla.nvim'
	use {
		'norcalli/nvim-colorizer.lua',
		config = require'colorizer'.setup()
	}
	use {
		'jakewvincent/mkdnflow.nvim',
		config = function()
			require('mkdnflow').setup({
				links_relative_to = 'current',
				evaluate_prefix = false,
				new_file_prefix = ''
			})
		end
	}
	use {
		'ellisonleao/glow.nvim',
	}
	use 'ekickx/clipboard-image.nvim'
	use {
		'oberblastmeister/neuron.nvim',
		requires = { {'nvim-telescope/telescope.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'} },
		config = function()
			require'neuron'.setup {
				virtual_titles = true,
				mappings = true,
				run = nil,
				neuron_dir = "~/doc/notes",
				leader = " "
			}
		end
	}

end)
