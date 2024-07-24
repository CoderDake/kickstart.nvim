vim.keymap.set('n', '<leader>St', '<cmd>windo set scrollbind!<CR>', { desc = '[S]crollbind [T]oggle' })
vim.keymap.set('n', '<leader><leader>x', '<cmd>w <bar> source %<CR>', { desc = 'e[X]ecute the current file' })
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
