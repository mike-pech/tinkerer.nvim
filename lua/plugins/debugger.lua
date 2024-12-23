require('dapui').setup()

local dap = require('dap')

-- make sure to install 'debugpy' via :Mason
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

dap.adapters.coreclr = {
  type = 'executable',
  command = '/path/to/dotnet/netcoredbg/netcoredbg',
  args = { '--interpreter=vscode' }
}
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}
dap.adapters["local-lua"] = {
  type = "executable",
  command = "node",
  args = {
    "/absolute/path/to/local-lua-debugger-vscode/extension/debugAdapter.js"
  },
  enrich_config = function(config, on_config)
    if not config["extensionPath"] then
      local c = vim.deepcopy(config)
      -- 💀 If this is missing or wrong you'll see
      -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
      c.extensionPath = "~/local-lua-debugger-vscode/"
      on_config(c)
    else
      on_config(config)
    end
  end,
}

dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
  }
}
dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb', -- adjust as needed, must be absolute path
  name = 'lldb'
}

-- DAP debugging keybinds
vim.keymap.set('n', '<leader>dt', ":lua require('dapui').toggle()<CR>", { desc = '[D]ebugger [T]oggle' })
vim.keymap.set('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>",
  { desc = '[D]ebugger toggle [B]reakpoint' })
vim.keymap.set('n', '<leader>dc', ":lua require'dap'.continue()<CR>",
  { desc = '[D]ebugger [C]ontinue' })
vim.keymap.set('n', '<leader>dsi', ":lua require'dap'.step_into()<CR>", { desc = '[D]ebugger [S]tep [I]nto' })
vim.keymap.set('n', '<leader>dso', ":lua require'dap'.step_over()<CR>", { desc = '[D]ebugger [S]tep [O]ver' })
vim.keymap.set('n', '<leader>dr', ":lua require('dapui').open({reset = true})<CR>", { desc = '[D]ebugger UI [R]eset' })
