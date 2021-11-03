vim.opt.termguicolors = true
require('plugins')

vim.opt.showmode = false
vim.opt.path = '.,,**'
vim.opt.termguicolors = true
-- Fix split spaw location
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true



vim.g.mapleader = " "
local keymap = vim.api.nvim_set_keymap
-- (mode, keymap, mappedto, options)

-- Map leader + s and v/h to open split 
keymap('n', '<leader>sv', ':sp<space>', {})
keymap('n', '<leader>sh', ':vsp<space>', {})

keymap('n', '<leader>tt', ':tabnew<space>', {})
keymap('n', '<leader>tf', ':tabfind<space>', {})
keymap('n', '<leader>te', ':tabedit<space>', {})

keymap('n', '<C-q>', ':mksession!<space>nvim-session<Enter>:wqa<Enter>', {})
keymap('n', '<C-s>', ':wa<Enter>:mksession!<space>nvim-session<Enter>', {})
keymap('n', '<C-p>', ':source<space>nvim-session<Enter>', {})

keymap('n', '<leader>y', '"+y', {})
keymap('n', '<leader>d', '"+d', {})
keymap('n', '<leader>p', '"+p', {})

keymap('v', '<leader>y', '"+y', {})
keymap('v', '<leader>d', '"+d', {})
keymap('v', '<leader>p', '"+p', {})

-- Keymaps for splits
keymap('n', '<C-h>', ':tabprevious<Enter>', {})
keymap('n', '<C-j>', '<C-w>j', {})
keymap('n', '<C-k>', '<C-w>k', {})
keymap('n', '<C-l>', ':tabnext<Enter>', {})

-- Keep visual selection after indentation
keymap('v', '<', '<gv', {})
keymap('v', '>', '>gv', {})

-- Fix Shift+Y to work like Shift+C
keymap('n', 'Y', 'y$', {})

-- Allow moving with hjkl in insert mode while holding control
keymap('i', '<C-h>', '<Left>', {})
keymap('i', '<C-j>', '<Down>', {})
keymap('i', '<C-k>', '<Up>', {})
keymap('i', '<C-l>', '<Right>', {})
