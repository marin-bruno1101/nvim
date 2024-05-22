return {
	{
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.buttons.val = {
				dashboard.button("n", "  New file", "<cmd>ene<CR>"),
				dashboard.button("f", "󰈞  Find file", "<cmd>Telescope find_files<CR>"),
				dashboard.button("e", "󰅚  Explorer", "<cmd>Ex<CR>"),
				dashboard.button("r", "  Recents", "<cmd>Telescope oldfiles<CR>"),
				dashboard.button("p", "󰏔  Sync plugins", "<cmd>Lazy sync<CR>"),
				dashboard.button("m", "󰏓  Manage plugins", "<cmd>Lazy<CR>"),
				dashboard.button("s", "  Settings", "<cmd>Ex $MYVIMRC/..<CR>"),
				dashboard.button("q", "󰅚  Quit NVIM", "<cmd>qa<CR>"),
			}

			dashboard.section.footer.val = "github.com/marin-bruno1101"

			alpha.setup(dashboard.config)
		end,
	},
}

