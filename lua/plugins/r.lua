return {
	{
		"R-nvim/R.nvim",
		lazy = false,
	},
	"R-nvim/cmp-r",
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			local cmp = require("cmp")

			require("cmp").setup({
				sources = { { name = "cmp_r" } },
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
			})
			require("cmp_r").setup({})
		end,
	},
}
