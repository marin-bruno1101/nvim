return {
	{
		"windwp/nvim-autopairs",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
				ts_config = {
					javascript = { "template_string" },
				},
			})
		end,
	},
}
