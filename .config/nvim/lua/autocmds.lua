vim.cmd('autocmd BufWritePost ~/.config/i3/config !i3-msg -q reload')

vim.cmd([[augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END]])

vim.cmd('autocmd BufWritePre todo.txt sort')
