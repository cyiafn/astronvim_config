return {
  "numToStr/Comment.nvim",
  event = "BufReadPost",
  config = function()
    require("Comment").setup()

    -- Normal mode: Toggle comment on the current line
    vim.keymap.set(
      "n",
      "<leader>/",
      function() require("Comment.api").toggle.linewise.current() end,
      { desc = "Toggle comment on current line" }
    )

    -- Visual mode: Toggle comment on the selected lines
    vim.keymap.set(
      "x",
      "<leader>/",
      "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = "Toggle comment on selected lines" }
    )
  end,
}
