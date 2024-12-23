# tinkerer.nvim

A nice NeoVim config I made throughout the year of using NeoVim as my IDE and tinkering around it.

Loosely based on [kickstart.nivm](https://github.com/nvim-lua/kickstart.nvim). A massive thanks to them for *kickstarting* my journey to this peculiar rabbit hole that NeoVim is!

## Features

* Gruvbox theme (my faviourite)
* Everything included in kickstart.nvim is here (perhaps)
* A simple terminal drawer
* A powerful netrw-inspired vim-fern file explorer (`\` key)
* telescope.nvim
* which-key.nvim
* Silicon.nvim for generating beautiful snapshots of your precious code 
    * Requires `silicon` binary and some configuration (Use \[S\]earch Live \[G\]rep `nvim-silicon` to get there :)
* DAP debugger
* Auto-format on save with your favourite LSP

## Requirements

* NeoVim version `>=0.9.5`
* Installations of your favourite languages. This config features Go, Python and lua
* A Nerd Font
* Optional
    * `fzf` and `ripgrep` for `telescope.nvim`
    * `fd` for `venv-selector.nvim`
    * For Windows users, `sh` and `find` command compatible with UNIX-like for `fzf` mappings in vim-fern.
    * `silicon` binary for code snapshots (more on Silicon [here](https://github.com/krivahtoo/silicon.nvim))
    * Debuggers for the languages of your choice (can be found [here](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation))

