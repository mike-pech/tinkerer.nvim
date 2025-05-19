require('dapui').setup()

local dap = require('dap')

-- make sure to install 'debugpy' via :Mason
require("dap-python").setup("python")
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return '/usr/bin/python'
    end,
  },
}
dap.adapters.bashdb = {
  type = 'executable',
  command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter',
  name = 'bashdb',
}
dap.configurations.sh = {
  {
    type = 'bashdb',
    request = 'launch',
    name = "Launch file",
    showDebugOutput = true,
    pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
    pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
    trace = true,
    file = "${file}",
    program = "${file}",
    cwd = '${workspaceFolder}',
    pathCat = "cat",
    pathBash = "/bin/bash",
    pathMkfifo = "mkfifo",
    pathPkill = "pkill",
    args = {},
    env = {},
    terminalKind = "integrated",
  }
}
-- delve is configured via 'nvim-dap-go'
require('dap-go').setup()

-- DAP debugging keybinds
vim.keymap.set('n', '<leader>dt', ":lua require('dapui').toggle()<CR>", { desc = '[D]ebugger [T]oggle' })
vim.keymap.set('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>",
  { desc = '[D]ebugger toggle [B]reakpoint' })
vim.keymap.set('n', '<leader>dc', ":lua require'dap'.continue()<CR>",
  { desc = '[D]ebugger [C]ontinue' })
vim.keymap.set('n', '<leader>dq', ":lua require'dap'.terminate()<CR>",
  { desc = '[D]ebugger [Q]uit' })
vim.keymap.set('n', '<leader>dsi', ":lua require'dap'.step_into()<CR>", { desc = '[D]ebugger [S]tep [I]nto' })
vim.keymap.set('n', '<leader>dso', ":lua require'dap'.step_over()<CR>", { desc = '[D]ebugger [S]tep [O]ver' })
vim.keymap.set('n', '<leader>dsq', ":lua require'dap'.step_out()<CR>", { desc = '[D]ebugger [S]tep out' })
vim.keymap.set('n', '<leader>dr', ":lua require('dapui').open({reset = true})<CR>", { desc = '[D]ebugger UI [R]eset' })
