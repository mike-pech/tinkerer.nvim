-- Credit for u/Ash2Ace for this simple terminal.
--
-- If you are reading this, please add licence to your code!
-- Also, sorry for butchering your coding style. It's just not in the style of this repo

local te_buf = nil
local te_win_id = nil

local function openTerminal(position)
  if vim.fn.bufexists(te_buf) ~= 1 then
    if position == "J" or position == "K" then
      vim.api.nvim_command("au TermOpen * setlocal nonumber norelativenumber")
      vim.api.nvim_command("sp | winc " .. position .. " | res 12 | te")
    else
      vim.api.nvim_command("au TermOpen * setlocal nonumber norelativenumber")
      vim.api.nvim_command("vs | winc " .. position .. " | vert res 80 | te")
    end
    te_win_id = vim.fn.win_getid()
    te_buf = vim.fn.bufnr('%')
  elseif vim.fn.win_gotoid(te_win_id) ~= 1 then
    if position == "J" or position == "K" then
      vim.api.nvim_command("sb " .. te_buf .. "| winc " .. position .. " | res 12")
      te_win_id = vim.fn.win_getid()
    else
      vim.api.nvim_command("sb " .. te_buf .. "| winc " .. position .. " | vert res 80")
      te_win_id = vim.fn.win_getid()
    end
  end
  vim.api.nvim_command("startinsert")
end

local function hideTerminal()
  if vim.fn.win_gotoid(te_win_id) == 1 then
    vim.api.nvim_command("hide")
  end
end

function ToggleTerminal(position)
  if vim.fn.win_gotoid(te_win_id) == 1 then
    hideTerminal()
  else
    openTerminal(position)
  end
end

vim.keymap.set('n', '<leader>tk', function() ToggleTerminal('K') end,
  { desc = 'Toggle [T]erminal horizontal [S]plit up' })
vim.keymap.set('n', '<leader>tj', function() ToggleTerminal('J') end,
  { desc = 'Toggle [T]erminal horizontal [S]plit down' })

vim.keymap.set('n', '<leader>tl', function() ToggleTerminal('L') end,
  { desc = 'Toggle [T]erminal [V]ertical split right' })
vim.keymap.set('n', '<leader>th', function() ToggleTerminal('H') end,
  { desc = 'Toggle [T]erminal horizontal [S]plit left' })
