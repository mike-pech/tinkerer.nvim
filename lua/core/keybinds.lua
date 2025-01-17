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

vim.keymap.set('n', '<leader>ve', '<cmd>VenvSelect<CR>', { desc = '[V]irtual [E]nvironment select' })

-- Window Split keymaps
vim.keymap.set('n', '<leader>ws', '<cmd>sp<CR>', { desc = '[W]indow [S]plit horizontal' })
vim.keymap.set('n', '<leader>wv', '<cmd>vs<CR>', { desc = '[W]indow [V]ertical split' })
vim.keymap.set('n', '<leader>wj', '<cmd>sp<CR>', { desc = '[W]indow [S]plit horizontal' })
vim.keymap.set('n', '<leader>wl', '<cmd>vs<CR>', { desc = '[W]indow [V]ertical split' })

-- Window resize
local sizemod = 4
-- Horizontal
vim.keymap.set('n', '<leader>w=', sizemod .. '<C-w>+', { desc = '[W]indow height increase' })
vim.keymap.set('n', '<leader>w-', sizemod .. '<C-w>-', { desc = '[W]indow height decrease' })
-- Vertical
vim.keymap.set('n', '<leader>w>', sizemod .. '<C-w>>', { desc = '[W]indow width increase' })
vim.keymap.set('n', '<leader>w<', sizemod .. '<C-w><', { desc = '[W]indow width decrease' })

-- Fern Vinegar mode
-- vim.keymap.set("n", "-", "<CMD>Fern .<CR>", { desc = "Open initial working directory" })

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
