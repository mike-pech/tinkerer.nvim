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

-- DAP debugging
vim.keymap.set('n', '<leader>dt', ":lua require('dapui').toggle()<CR>", { desc = '[D]ebugger [T]oggle' })
vim.keymap.set('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>",
  { desc = '[D]ebugger toggle [B]reakpoint' })
vim.keymap.set('n', '<leader>dc', ":lua require'dap'.continue()<CR>",
  { desc = '[D]ebugger [C]ontinue' })
vim.keymap.set('n', '<leader>dsi', ":lua require'dap'.step_into()<CR>", { desc = '[D]ebugger [S]tep [I]nto' })
vim.keymap.set('n', '<leader>dso', ":lua require'dap'.step_over()<CR>", { desc = '[D]ebugger [S]tep [O]ver' })
vim.keymap.set('n', '<leader>dr', ":lua require('dapui').open({reset = true})<CR>", { desc = '[D]ebugger UI [R]eset' })

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
