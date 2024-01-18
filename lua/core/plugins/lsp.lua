return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"lukas-reineke/lsp-format.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"efm",
					"tsserver",
					"tailwindcss",
				},
			})

			local lspconfig = require("lspconfig")
			local lsp_format = require("lsp-format")

			local prettier = {
				formatCommand = "prettier --stdin-filepath ${INPUT} ${--tab-width:tab-width}",
				formatStdin = true,
			}

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end,

				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,

				["pylsp"] = function()
					lspconfig.pylsp.setup({
						settings = {
							pylsp = {
								plugins = {
									pycodestyle = {
										ignore = { "W391" },
									},
								},
							},
						},
					})
				end,

				["efm"] = function()
					lsp_format.setup({})
					lspconfig.efm.setup({
						on_attach = lsp_format.on_attach,
						init_options = { documentFormatting = true },
						filetypes = {
							"typescript",
							"typescriptreact",
							"javascript",
							"javascriptreact",
							"html",
							"css",
							"json",
							"lua",
							"python",
						},
						settings = {
							rootMarkers = { ".git/" },
							languages = {
								typescript = { prettier },
								typescriptreact = { prettier },
								javascript = { prettier },
								javascriptreact = { prettier },
								html = { prettier },
								css = { prettier },
								json = { prettier },
								lua = {
									{
										formatCanRange = true,
										formatCommand = "stylua -",
										formatStdin = true,
									},
								},
								python = {
									{
										formatCommand = "autopep8 -",
										formatStdin = true,
									},
								},
							},
						},
					})
				end,
			})
		end,
	},
}
