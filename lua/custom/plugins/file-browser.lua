return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      -- Load the file-browser extension
      require("telescope").load_extension "file_browser"

      -- Set keybindings for telescope-file-browser
      -- For example, pressing <leader>fb opens the file browser in the current working directory
      vim.keymap.set(
        "n",
        "<leader>fB",
        ":Telescope file_browser<CR>",
        { noremap = true, silent = true, desc = "Open File Browser in Workspace Root" }
      )

      -- open file_browser with the path of the current buffer
      vim.keymap.set(
        "n",
        "<space>fb",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { noremap = true, silent = true, desc = "Open File Browser in cwd" }
      )

      -- If you want another keymap that starts in the current file's directory, you can do:
      -- vim.keymap.set("n", "<leader>fB", ":Telescope file_browser path=%:p:h<CR>", { noremap = true, silent = true, desc = "Open File Browser at Current File's Directory" })
    end,
  },
}
