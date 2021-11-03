vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
		-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'folke/tokyonight.nvim',
		config = function() 
			vim.g.tokyonight_style = "night"
			vim.cmd('colorscheme tokyonight')
		end
	}
	use {
		'neovim/nvim-lspconfig',
		ft = { 'cpp', 'hpp', 'c', 'h', 'rs', 'sh', 'tex', 'py', 'lua', 'html', 'css', 'json' },
		wants = { 'nvim-cmp', 'nvim-treesitter' },
		config = function()

			local lsp = require'lspconfig'
			
			local on_attach = function(client, bufnr)
				local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local function option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

			 local opts = { noremap = true, silent = true }

				keymap('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
				keymap('n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
				keymap('n', '<leader>lK', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
				keymap('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
				keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
				keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
				keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
				keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
				keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
				keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
				keymap('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
				keymap('n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
				keymap('n', '<leader>le', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
				keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
				keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
				keymap('n', '<leader>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
				keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

			end

			local servers = { 'ccls', 'texlab', 'rust_analyzer', 'pyright' }

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
	use { 
		'hrsh7th/nvim-cmp',
		requires = { 
			{'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
			{'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
			{'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
			{'hrsh7th/vim-vsnip', after = 'nvim-cmp' }
		},
		cmd = 'cmp',
		config = function()
			vim.o.completeopt = "menuone,noinsert,noselect"
			vim.o.shortmess = vim.o.shortmess .. 'c'
			local cmp = require'cmp'
			cmp.setup({
				sources = {
					{ name = 'nvim_lsp'},
					{ name = 'buffer'}
				},
				mapping = {
					['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					['<CR>'] = cmp.mapping.confirm({ select = true })
				},
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end
				}
			})
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		cmd = 'ts',
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
				enable = false
			}
		} end
	}

	use {
		'lukas-reineke/indent-blankline.nvim',
		after = 'nvim-lspconfig',
		config = function()
			require'indent_blankline'.setup {
				buftype_exclude = {'terminal'}
			}
		end
	}

	use {
		'steelsojka/pears.nvim',
		after = 'nvim-lspconfig',
		config = function()
			require'pears'.setup()
		end
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			local keymap = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }

			keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
			keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
			keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)
			keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
		end
	}
	use {
		'jbyuki/nabla.nvim',
		ft = 'md'
	}
	use {
		'norcalli/nvim-colorizer.lua',
		config = require'colorizer'.setup()
	}
	use {
		'jakewvincent/mkdnflow.nvim',
		ft = 'md',
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
		ft = 'md'
	}
	use {
		'ekickx/clipboard-image.nvim'
	}
	use {
		'oberblastmeister/neuron.nvim',
		ft = 'md',
		requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', {'nvim-lua/popup.nvim', after = 'neuron.nvim' } },
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
	use {
		'phaazon/hop.nvim',
		config = function()
			local keymap = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }
			local modes = { 'n', 'v' }

			for _, mode in ipairs(modes)  do
				-- TODO add visual support, translate :Hop into lua fucntions (:h hint_words)
				keymap(mode, '<leader><leader>w', ':HopWord<CR>', opts)
				keymap(mode, '<leader><leader>Jw', ':HopWordAC<CR>', opts)
				keymap(mode, '<leader><leader>Kw', ':HopWordBC<CR>', opts)

				keymap(mode, '<leader><leader>c', ':HopChar1<CR>', opts)
				keymap(mode, '<leader><leader>Jc', ':HopChar1AC<CR>', opts)
				keymap(mode, '<leader><leader>Kc', ':HopChar1BC<CR>', opts)

				keymap(mode, '<leader><leader>C', ':HopChar2<CR>', opts)
				keymap(mode, '<leader><leader>JC', ':HopChar2AC<CR>', opts)
				keymap(mode, '<leader><leader>KC', ':HopChar2BC<CR>', opts)

				keymap(mode, '<leader><leader><leader>', ':HopLineStart<CR>', opts)
				keymap(mode, '<leader><leader>j', ':HopLineStartAC<CR>', opts)
				keymap(mode, '<leader><leader>k', ':HopLineStartBC<CR>', opts)

				keymap(mode, '<leader><leader>g', ':HopPattern<CR>', opts)
				keymap(mode, '<leader><leader>Jg', ':HopPatternAC<CR>', opts)
				keymap(mode, '<leader><leader>Kg', ':HopPatternBC<CR>', opts)
			end
		end
			
	}

	use {
		'tversteeg/registers.nvim'
	}

	use {
		'folke/which-key.nvim',
		config = function()
			require("which-key").setup()
		end
	}

	use {
		'edluffy/hologram.nvim',
		config = require('hologram').setup()
	}

end)

