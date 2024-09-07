return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"markdown",
				"markdown_inline",
				"r",
				"rnoweb",
				"yaml",
			},
			auto_install = true,
			highlight = {
				enabled = true,
			},
			indent = {
				enabled = true,
			},
		})
	end,
}
