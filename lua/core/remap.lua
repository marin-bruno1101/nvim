vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "<leader>fm", function()
	vim.lsp.buf.format()
end)

