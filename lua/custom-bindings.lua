local map = vim.api.nvim_set_keymap

-- general
map("n", "<leader>w", ":w<CR>", { silent = false, desc = "[w]rite file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit current buffer" })

-- buffer
vim.keymap.set("n", "<leader>c", ":bdelete<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bC", ":bufdo bdelete<CR>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>bp", ":b#<CR>", { desc = "Go to the previous buffer" })
