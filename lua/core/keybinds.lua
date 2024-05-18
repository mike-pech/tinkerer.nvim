-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Fern Vinegar mode
-- vim.keymap.set("n", "-", "<CMD>Fern .<CR>", { desc = "Open initial working directory" })

-- Godot debugging
vim.keymap.set('n', '<leader>gd', require('godot').debugger.debug, { desc = 'Enter [G]odot [d]ebugger' })
vim.keymap.set('n', '<leader>gb', require('godot').debugger.debug_at_cursor, { desc = 'Set [G]odot [b]reakpoint at cursor' })
vim.keymap.set('n', '<leader>gs', require('godot').debugger.step, { desc = '[G]odot debugger [s]tep' })
vim.keymap.set('n', '<leader>gc', require('godot').debugger.continue, { desc = '[G]odot debugger [c]ontinue' })
vim.keymap.set('n', '<leader>gq', require('godot').debugger.quit, { desc = '[Q]uit [G]odot debugger' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

