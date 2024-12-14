local map = vim.api.nvim_set_keymap

map("n", "<leader>w", ":w<CR>", { noremap = true, silent = false, desc = "[w]rite file" })
