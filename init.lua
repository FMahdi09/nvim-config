vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set autoindent")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set smarttab")
vim.cmd("set softtabstop=4")
vim.g.mapleader = " "

-- custom key maps
vim.cmd("inoremap jk <Esc>")
vim.cmd("inoremap kj <Esc>")

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- telescope
	"nvim-telescope/telescope.nvim", tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	-- treesitter
	{{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}},
	-- neo-tree
	{
	    "nvim-neo-tree/neo-tree.nvim",
	    branch = "v3.x",
	    dependencies = {
	      "nvim-lua/plenary.nvim",
	      "nvim-tree/nvim-web-devicons",
	      "MunifTanjim/nui.nvim",
	    }
	}
}
local opts = {}
require("lazy").setup(plugins, opts)

-- telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>c", builtin.git_bcommits, {})
vim.keymap.set("n", "<leader>b", builtin.git_branches, {})
vim.keymap.set("n", "<leader>g", builtin.live_grep, {})

-- treesitter config
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"javascript", "lua", "typescript"},
	highlight = {enabled = true},
	indent = {enabled = true},
})

-- neo-tree keymaps
vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", {})
