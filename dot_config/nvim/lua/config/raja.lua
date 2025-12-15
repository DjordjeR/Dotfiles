-- Basic Neovim options

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set line numbers to absolute and relative
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Other options
vim.o.wrap = false
vim.o.showmatch = true
vim.o.clipboard = "unnamedplus"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.g.has("wsl") == 1 then
	vim.opt.clipboard = ""
	vim.g.clipboard = nil
	vim.g.loaded_clipboard_provider = 1
end

-- Enable termguicolors
vim.o.termguicolors = true

-- Fixes my problem with zz screen centering
vim.o.lazyredraw = true

-- Add line at 80 char
vim.opt.colorcolumn = "80"
