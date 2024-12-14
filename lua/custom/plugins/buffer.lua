return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        options = {
          indicator = {
            style = "underline",
            diagnostics = "nvim_lsp",
          },
        },
      }
      -- Keymaps requiring bufferline.nvim
      vim.keymap.set("n", "]b", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
      vim.keymap.set("n", "[b", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
      vim.keymap.set("n", ">b", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
      vim.keymap.set("n", "<b", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
      vim.keymap.set("n", "<leader>bb", ":BufferLinePick<CR>", { desc = "Buffer tab interactive picker" })
      vim.keymap.set(
        "n",
        "<leader>bd",
        ":BufferLinePickClose<CR>",
        { desc = "Delete a buffer tab with interactive picker" }
      )
      vim.keymap.set(
        "n",
        "<leader>bc",
        ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>",
        { desc = "Close all buffers except current" }
      )
      vim.keymap.set(
        "n",
        "<leader>bl",
        ":BufferLineCloseLeft<CR>",
        { desc = "Close all buffers to the left of current" }
      )
      vim.keymap.set(
        "n",
        "<leader>br",
        ":BufferLineCloseRight<CR>",
        { desc = "Close all buffers to the right of current" }
      )
      vim.keymap.set("n", "<leader>bse", ":BufferLineSortBy extension<CR>", { desc = "Sort buffers by extension" })
      vim.keymap.set("n", "<leader>bsi", ":BufferLineSortBy buffer_id<CR>", { desc = "Sort buffers by buffer number" })
      vim.keymap.set(
        "n",
        "<leader>bsm",
        ":BufferLineSortBy modified<CR>",
        { desc = "Sort buffers by last modification" }
      )
      vim.keymap.set("n", "<leader>bsp", ":BufferLineSortBy full_path<CR>", { desc = "Sort buffers by full path" })
      vim.keymap.set(
        "n",
        "<leader>bsr",
        ":BufferLineSortBy relative_directory<CR>",
        { desc = "Sort buffers by relative path" }
      )
      vim.keymap.set(
        "n",
        "<leader>b\\",
        ":split | BufferLinePick<CR>",
        { desc = "Open buffer in new horizontal split" }
      )
      vim.keymap.set("n", "<leader>b|", ":vsplit | BufferLinePick<CR>", { desc = "Open buffer in new vertical split" })
      vim.keymap.set("n", "<leader>bP", ":BufferLineTogglePin<CR>", { desc = "Pin/unpin current buffer" })
    end,
  },
}
