return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = 'ChevyNotes',
        path = '~/ChevyNotes/',
      },
      {
        name = 'JobberNotes',
        path = '~/JobberNotes/',
      },
    },

    -- see below for full list of options 👇
  },
  config = function(_, opts)
    local obsidian = require 'obsidian'
    function omap(suffix, strCmd, desc)
      vim.keymap.set('n', '<leader>j' .. suffix, '<cmd>ObsidianWorkspace JobberNotes<CR>' .. strCmd, { desc = '[J]obber ' .. desc })
      vim.keymap.set('n', '<leader>z' .. suffix, '<cmd>ObsidianWorkspace ChevyNotes<CR>' .. strCmd, { desc = '[Z]ettelKasten ' .. desc })
    end
    omap('s', '<cmd>ObsidianSearch<CR>', '[S]earch')
    omap('q', '<cmd>ObsidianOpen<CR>', '[O]pen')
    omap('n', '<cmd>ObsidianNew<CR>', '[N]ew')
    -- omap('', '<cmd>ObsidianQuickSwitch<CR>')
    -- omap('', '<cmd>ObsidianFollowLink [vsplit|hsplit]<CR>')
    -- omap('', '<cmd>ObsidianBacklinks<CR>')
    omap('T', '<cmd>ObsidianTags<CR>', '[T]ags')
    omap('d', '<cmd>ObsidianToday<CR>', 'To[D]ay')
    omap('t', '<cmd>ObsidianTomorrow<CR>', '[T]omorrow')
    omap('y', '<cmd>ObsidianYesterday<CR>', '[Y]esterday')
    omap('D', '<cmd>ObsidianDailies<CR>', '[D]ailies')
    omap('M', '<cmd>ObsidianTemplate', 'Te[M]plate')
    omap('l', '<cmd>ObsidianLink<CR>', '[L]ink')
    omap('L', '<cmd>ObsidianLinkNew<CR>', '[L]ink New')
    omap('k', '<cmd>ObsidianLinks<CR>', '[L]inks')
    omap('x', '<cmd>ObsidianExtractNote', 'E[X]tract Note')
    -- omap('', '<cmd>ObsidianWorkspace [NAME]<CR>')
    -- omap('', '<cmd>ObsidianPasteImg [IMGNAME]<CR>')
    -- omap('', '<cmd>ObsidianRename new-id --dry-run<CR>')
    -- omap('', '<cmd>ObsidianToggleCheckbox<CR>')
    -- omap('', '<cmd>ObsidianNewFromTemplate [PATH] [TEMPLATE]<CR>')
    -- omap('', '<cmd>ObsidianTOC<CR>')
    opts['note_id_func'] = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ''
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. '-' .. suffix
    end
    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    opts['follow_url_func'] = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart { 'open', url } -- Mac OS
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
      -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
    end
    obsidian.setup(opts)
  end,
}
