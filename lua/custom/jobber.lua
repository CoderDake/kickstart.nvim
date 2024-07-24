-- Tools that are helpful for Jobberinos
function currentFileDiffRanges()
  local currentFile = vim.fn.expand('%')
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
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
vim.api.nvim_create_user_command('DiffFormat', function()
  local ranges = currentFileDiffRanges()
  local format = require('conform').format
  for _, range in pairs(ranges) do
    format {
      range = range,
    }
  end
end, { desc = 'Format changed lines' })

