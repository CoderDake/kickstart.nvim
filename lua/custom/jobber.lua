-- Tools that are helpful for Jobberinos
function currentFileDiffRanges()
  local currentFile = vim.fn.expand '%'
  print('getting diff for ' .. currentFile)
  local lines = vim.fn.system('git diff --unified=0 ' .. currentFile):gmatch '[^\n\r]+'
  local ranges = {}

  for line in lines do
    if line:find '^@@' then
      local line_nums = line:match '%+.- '
      if line_nums:find ',' then
        local _, _, first, second = line_nums:find '(%d+),(%d+)'
        table.insert(ranges, {
          start = { tonumber(first), 0 },
          ['end'] = { tonumber(first) + tonumber(second), 0 },
        })
      else
        local first = tonumber(line_nums:match '%d+')
        table.insert(ranges, {
          start = { first, 0 },
          ['end'] = { first + 1, 0 },
        })
      end
    end
  end
  return ranges
end

function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then
        k = '"' .. k .. '"'
      end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

-- https://github.com/stevearc/conform.nvim/issues/92#issuecomment-1751799876
vim.api.nvim_create_user_command('DiffFormat', function(opts)
  print('ARGS: ' .. dump(opts))
  local bufnr = opts.args.bufnr
  print('Buffnr: ' .. bufnr)
  local lines = vim.fn.system('git diff --unified=0'):gmatch '[^\n\r]+'
  local ranges = {}
  for line in lines do
    if line:find '^@@' then
      local line_nums = line:match '%+.- '
      if line_nums:find ',' then
        local _, _, first, second = line_nums:find '(%d+),(%d+)'
        table.insert(ranges, {
          start = { tonumber(first), 0 },
          ['end'] = { tonumber(first) + tonumber(second), 0 },
        })
      else
        local first = tonumber(line_nums:match '%d+')
        table.insert(ranges, {
          start = { first, 0 },
          ['end'] = { first + 1, 0 },
        })
      end
    end
  end
  local format = require('conform').format
  for _, range in pairs(ranges) do
    print('Formatting range: ' .. dump(range))
    format {
      bufnr = bufnr,
      range = range,
    }
  end
end, { desc = 'Format changed lines' })
vim.keymap.set('n', '<leader>JO', '<cmd>e /Users/chevy/workspace/Jobber/config/environments/development.override.rb<CR>')
vim.keymap.set('n', '<leader>JL', '<cmd>e /Users/chevy/workspace/Jobber/.env.development.local<CR>')
