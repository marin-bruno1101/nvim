return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"efm",
					"ts_ls",
					"tailwindcss",
				},
			})

			local lspconfig = require("lspconfig")

			local prettier = {
				formatCommand = "prettierd ${INPUT}",
				formatStdin = true,
			}

			local prettier_configured = {
				formatCommand = "prettierd ${INPUT}",
				formatStdin = true,
				env = {
					string.format(
						"PRETTIERD_DEFAULT_CONFIG=%s",
						vim.fn.expand(vim.fn.stdpath("config") .. "/utils/linter-config/.prettierrc")
					),
				},
			}

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end,

				["ts_ls"] = function()
					lspconfig.ts_ls.setup({
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
					lspconfig.efm.setup({
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
							"cpp",
						},
						settings = {
							rootMarkers = { ".git/" },
							languages = {
								typescript = { prettier_configured },
								typescriptreact = { prettier_configured },
								javascript = { prettier_configured },
								javascriptreact = { prettier_configured },
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
								cpp = {
									{
										formatCommand = "clang-format",
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

