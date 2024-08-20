vim.keymap.set('n', '<leader>St', '<cmd>windo set scrollbind!<CR>', { desc = '[S]crollbind [T]oggle' })
vim.keymap.set('n', '<leader><leader>x', '<cmd>w <bar> source %<CR>', { desc = 'e[X]ecute the current file' })
vim.keymap.set('n', '<leader>PP', function()
  local localPath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
  local lineNumber, _ = unpack(vim.api.nvim_win_get_cursor(0))
  vim.fn.setreg('+', localPath .. ':' .. lineNumber)
end, { desc = 'Copy Relative Path to Clipboard' })
vim.keymap.set('n', '<leader>PM', function()
  local githubPrefix = 'https://github.com/GetJobber/Jobber/blob/master/'
  local localPath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
  local lineNumber, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local combined = githubPrefix .. localPath .. '#L' .. lineNumber
  vim.fn.setreg('+', combined)
end, { desc = 'Copy github [M]aster path to line' })
vim.keymap.set('n', '<leader>be', function()
  local value = vim.fn.expand(vim.fn.getreg '+')
  local escaped = vim.fn.escape(value, '/\\')
  vim.fn.setreg('+', escaped)
end, { desc = '[E]scape the copy [B]uffer' })
-- vim.keymap.set('v', '<leader>Fj', function()
--   local vstart = vim.fn.getpos "'<"
--
--   local vend = vim.fn.getpos "'>"
--
--   local line_start = vstart[2]
--   local line_end = vend[2]
--
--   local file = io.open(os.tmpname() + '.json', 'w')
--   file.write(vim.fn.getline())
--   file.close()
-- end, { desc = '[S]crollbind [T]oggle' })
--
--
