local map = vim.api.nvim_set_keymap

-- general
map("n", "<leader>w", ":w<CR>", { silent = false, desc = "[w]rite file" })
map("n", "<leader>q", ":q<CR>", { silent = false, desc = "[q]uit buffer" })
map(
  "n",
  "<leader>ypr",
  ':let @+ = expand("%")<CR>',
  { noremap = true, silent = true, desc = "[y]ank [p]ath [r]elative" }
)
map(
  "n",
  "<leader>ypa",
  ':let @+ = expand("%:p")<CR>',
  { noremap = true, silent = true, desc = "[y]ank [p]ath [a]bsolute" }
)
map(
  "n",
  "<leader>cr",
  ':let @+ = expand("%") . ":" . line(".")<CR>',
  { noremap = true, silent = true, desc = "[y]ank relative [p]ath with [l]ine number" }
)

-- buffer
vim.keymap.set("n", "<leader>c", ":bdelete<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bC", ":bufdo bdelete<CR>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>bp", ":b#<CR>", { desc = "Go to the previous buffer" })
