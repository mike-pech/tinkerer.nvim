vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable netrw at the very start
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require 'core.lazy'
require 'core.keybinds'
require 'core.terminal'
require 'plugins.lsp'
require 'plugins.telescope'
require 'plugins.treesitter'
require 'plugins.cmp'
require 'plugins.formatter'
require 'plugins.debugger'
require 'plugins.silicon'

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- For a powerful jumpstart of your coding session
-- If your deadline is closing in, an additional shout of "EBASH!" may give an extra boost :D
vim.api.nvim_create_user_command("EBASH", function()
  vim.api.nvim_input('<C-w>s')
  vim.api.nvim_input('<C-j>:e term://bash<CR>')
  local winsize = vim.api.nvim_win_get_height(0)
  vim.api.nvim_input(':res -' .. math.ceil(winsize / 4) .. '<CR>')
  vim.api.nvim_input('<C-k>\\')
end, {})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
