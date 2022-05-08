-------------------------------------------------------------
-- Autocommands
-------------------------------------------------------------

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.tex', '*.md', '*.txt' },
  command = 'setlocal wrap linebreak nolist'
})
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  pattern = { '*.*' },
  command = 'set norelativenumber',
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = { '*.*' },
  command = 'set relativenumber',
})
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  pattern = { '~/.config/nvim/init.lua', '~/.config/nvim/lua/init/*.lua' },
  --command = 'source ~/.config/nvim/init.lua'
  command = 'echo "HERE"'	
})
