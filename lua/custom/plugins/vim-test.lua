return {
  'vim-test/vim-test',
  config = function()
    vim.g['test#ruby#bundle_exec'] = 1
    vim.g['test#ruby#use_binstubs'] = 1
    vim.g['test#typescript#jest#executable'] = 'npm test'
    vim.g['test#ruby#rspec#executable'] = 'bundle exec rspec'
    -- :TestNearest 	In a test file runs the test nearest to the cursor, otherwise runs the last nearest test. In test frameworks that don't support line numbers it will polyfill this functionality with regexes.
    -- :TestClass 	In a test file runs the first test class found on the same line as or above the cursor. (Currently only supported by Pytest)
    -- :TestFile 	In a test file runs all tests in the current file, otherwise runs the last file tests.
    -- :TestSuite 	Runs the whole test suite (if the current file is a test file, runs that framework's test suite, otherwise determines the test framework from the last run test).
    -- :TestLast 	Runs the last test.
    -- :TestVisit 	Visits the test file from which you last run your tests (useful when you're trying to make a test pass, and you dive deep into application code and close your test buffer to make more space, and once you've made it pass you want to go back to the test file to write more tests).
    vim.keymap.set('n', '<leader>tr', '<cmd>TestNearest<CR>', { desc = '[T]est [R]un' })
    -- vim.keymap.set('n', '<leader>ta', function()
    --   neotest.run.attach()
    -- end, { desc = '[T]est Run [A]ttach' })
    vim.keymap.set('n', '<leader>tR', '<cmd>TestFile<CR>', { desc = '[T]est [R]un All' })
    vim.keymap.set('n', '<leader>tl', '<cmd>TestLast<CR>', { desc = '[T]est [L]ast' })
    vim.keymap.set('n', '<leader>tv', '<cmd>TestVisit<CR>', { desc = '[T]est [V]isit last' })
  end,
}
