return { 
	'hrsh7th/nvim-cmp',
	requires = { 
		{'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
		{'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
		{'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
		{'hrsh7th/vim-vsnip', after = 'nvim-cmp' },
		{'hrsh7th/vim-vsnip-integ', after = 'nvim-cmp' },
	},
	cmd = 'cmp',
	config = function()
		vim.o.completeopt = "menuone,noinsert,noselect"
		vim.o.shortmess = vim.o.shortmess .. 'c'
		--vim.cmd("let g:vsnip_snippet_dir = expand('~/.config/nvim/snippets')")
		local cmp = require('cmp')
		local kind_icons = {
			Text = "",
			Method = "",
			Function = "",
			Constructor = "",
			Field = "",
			Variable = "",
			Class = "ﴯ",
			Interface = "",
			Module = "",
			Property = "ﰠ",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = ""
		}
		cmp.setup({
			sources = cmp.config.sources({
				{ name = 'vsnip'},
				{ name = 'nvim_lsp'},
				--{ name = 'buffer'}
			}),
			mapping = {
				['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				['<C-Space>'] = cmp.mapping.complete({ behavior = cmp.SelectBehavior.Insert}),
				['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false, })
			},
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end
			},
			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
				--[[vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[LaTeX]",
					})[entry.source.name]--]]
					return vim_item
				end
			}
		})
	end
}
