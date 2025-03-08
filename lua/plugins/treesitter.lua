return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua",
				"markdown",
				"markdown_inline",
				"yaml",
				"python",
			},
			highlight = {
				enabled = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enabled = true,
			},
		})
	end,
}
