vim.g.mapleader = " "
local keymap = vim.keymap.set
-- (mode, keymap, mappedto, options)
local opt = { noremap = true, silent = true }

keymap('n', '<leader><leader>',
	function() require('luasnip').jump(1) end,
	{noremap = true, silent = true})

-- Map leader + s and v/h to open split 
keymap('n', '<leader>sp', ':sp<CR>', opt)
keymap('n', '<leader>sv', ':vsp<CR>', opt)

keymap('n', '<leader>q', ':q<CR>', opt)

keymap('n', '<C-q>', ':mksession!<space>nvim-session<Enter>:wqa<Enter>', opt)
keymap('n', '<C-s>', ':wa<Enter>:mksession!<space>nvim-session<Enter>', opt)
keymap('n', '<C-p>', ':source<space>nvim-session<Enter>', opt)

keymap('n', '<leader>y', '"+y', opt)
keymap('n', '<leader>d', '"+d', opt)
keymap('n', '<leader>p', '"+p', opt)
keymap('n', '<leader>Y', '"+Y', opt)
keymap('n', '<leader>D', '"+D', opt)
keymap('n', '<leader>P', '"+P', opt)

keymap('n', '<C-j>', '<cmd>cnext<CR>', opt)
keymap('n', '<C-k>', '<cmd>cprev<CR>', opt)
keymap('n', '<leader>j', '<cmd>lnext<CR>', opt)
keymap('n', '<leader>k', '<cmd>lprev<CR>', opt)

keymap('n', '<M-h>', '<C-w>h', opt)
keymap('n', '<M-k>', '<C-w>k', opt)
keymap('n', '<M-j>', '<C-w>j', opt)
keymap('n', '<M-l>', '<C-w>l', opt)

-- Create a new kitty window on the current working directory
keymap('n', '<leader>sn', '<cmd>silent !setsid kitty -d $(pwd)<CR>', opt)

keymap('v', '<leader>y', '"+y', opt)
keymap('v', '<leader>d', '"+d', opt)
keymap('v', '<leader>p', '"+p', opt)
keymap('v', '<leader>Y', '"+Y', opt)
keymap('v', '<leader>D', '"+D', opt)
keymap('v', '<leader>P', '"+P', opt)

-- Keep visual selection after indentation
keymap('v', '<', '<gv', opt)
keymap('v', '>', '>gv', opt)

-- Fix Shift+Y to work like Shift+C
keymap('n', 'Y', 'y$', opt)

-- Allow moving with hjkl in insert mode while holding control
keymap('i', '<C-h>', '<Left>', opt)
keymap('i', '<C-j>', '<Down>', opt)
keymap('i', '<C-k>', '<Up>', opt)
keymap('i', '<C-l>', '<Right>', opt)

keymap('i', '<C-BS>', '<C-w>', opt)


