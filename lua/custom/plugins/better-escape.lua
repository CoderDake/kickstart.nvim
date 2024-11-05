return {
  'max397574/better-escape.nvim',
  config = function()
    -- disable esc to teach better habbits
    vim.keymap.set('i', '<Esc>', '<cmd>lua print("ESC disabled in i mode, use jj instead")<CR>')

    require('better_escape').setup {
      timeout = vim.o.timeoutlen,
      default_mappings = false,
      mappings = {
        i = {
          j = {
            -- These can all also be functions
            j = '<Esc>',
          },
        },
        c = {
          j = {
            j = '<Esc>',
          },
        },
        t = {
          j = {
            j = '<C-\\><C-n>',
          },
        },
        v = {
          j = {
            j = '<Esc>',
          },
        },
        s = {
          j = {
            j = '<Esc>',
          },
        },
      },
    }
  end,
}
