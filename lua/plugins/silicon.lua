require("nvim-silicon").setup({
  font = "Maple Mono NF=24",       -- Make sure to have the font installed on your machine!
  background = "#202020",
  theme = "gruvbox-dark",
  no_line_number = true,
  pad_vert = 80,
  pad_horiz = 50,
  to_clipboard = true,
  -- path = ".",
  -- format = "silicon_[year]-[month]-[day]_[hour]-[minute]-[second].png",
  window_title = function()
    return vim.fn.fnamemodify(
      vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
      ":t"
    )
  end
})
