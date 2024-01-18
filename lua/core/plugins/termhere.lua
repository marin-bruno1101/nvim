return {
	{
		"TamaMcGlinn/vim-termhere",
		config = function()
			vim.keymap.set("n", "<leader>cc", function()
				vim.cmd(":call termhere#OpenSplitTerminal()")
			end)
		end,
	},
}
