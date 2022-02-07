return {
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
